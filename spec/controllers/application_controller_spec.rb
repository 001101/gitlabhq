require 'spec_helper'

describe ApplicationController do
  describe '#check_password_expiration' do
    let(:user) { create(:user) }
    let(:controller) { ApplicationController.new }

    it 'should redirect if the user is over their password expiry' do
      user.password_expires_at = Time.new(2002)
      expect(user.ldap_user?).to be_falsey
      allow(controller).to receive(:current_user).and_return(user)
      expect(controller).to receive(:redirect_to)
      expect(controller).to receive(:new_profile_password_path)
      controller.send(:check_password_expiration)
    end

    it 'should not redirect if the user is under their password expiry' do
      user.password_expires_at = Time.now + 20010101
      expect(user.ldap_user?).to be_falsey
      allow(controller).to receive(:current_user).and_return(user)
      expect(controller).not_to receive(:redirect_to)
      controller.send(:check_password_expiration)
    end

    it 'should not redirect if the user is over their password expiry but they are an ldap user' do
      user.password_expires_at = Time.new(2002)
      allow(user).to receive(:ldap_user?).and_return(true)
      allow(controller).to receive(:current_user).and_return(user)
      expect(controller).not_to receive(:redirect_to)
      controller.send(:check_password_expiration)
    end
  end

  describe "#authenticate_user_from_private_token!" do
    controller(ApplicationController) do
      def index
        render text: "authenticated"
      end
    end

    let(:user) { create(:user) }

    it "logs the user in when the 'private_token' param is populated with the private token" do
      get :index, private_token: user.private_token
      expect(response.status).to eq(200)
      expect(response.body).to eq("authenticated")
    end

    it "logs the user in when the 'PRIVATE-TOKEN' header is populated with the private token" do
      @request.headers['PRIVATE-TOKEN'] = user.private_token
      get :index
      expect(response.status).to eq(200)
      expect(response.body).to eq("authenticated")
    end

    it "doesn't log the user in otherwise" do
      @request.headers['PRIVATE-TOKEN'] = "token"
      get :index, private_token: "token", authenticity_token: "token"
      expect(response.status).to_not eq(200)
      expect(response.body).to_not eq("authenticated")
    end
  end

  describe "#authenticate_user_from_personal_access_token!" do
    controller(ApplicationController) do
      def index
        render text: 'authenticated'
      end
    end

    let(:user) { create(:user) }
    let(:personal_access_token) { create(:personal_access_token, user: user) }

    it "logs the user in when the 'personal_access_token' param is populated with the personal access token" do
      get :index, personal_access_token: personal_access_token.token
      expect(response.status).to eq(200)
      expect(response.body).to eq('authenticated')
    end

    it "logs the user in when the 'PERSONAL_ACCESS_TOKEN' header is populated with the personal access token" do
      @request.headers["PERSONAL_ACCESS_TOKEN"] = personal_access_token.token
      get :index
      expect(response.status).to eq(200)
      expect(response.body).to eq('authenticated')
    end

    it "doesn't log the user in otherwise" do
      get :index, personal_access_token: "token"
      expect(response.status).to_not eq(200)
      expect(response.body).to_not eq('authenticated')
    end
  end
end

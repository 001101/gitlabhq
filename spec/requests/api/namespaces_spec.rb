require 'spec_helper'

describe API::Namespaces do
  let(:admin) { create(:admin) }
  let(:user) { create(:user) }
  let!(:group1) { create(:group) }
  let!(:group2) { create(:group, :nested) }

  describe "GET /namespaces" do
    context "when unauthenticated" do
      it "returns authentication error" do
        get api("/namespaces")
        expect(response).to have_gitlab_http_status(401)
      end
    end

    context "when authenticated as admin" do
      it "returns correct attributes" do
        get api("/namespaces", admin)

        group_kind_json_response = json_response.find { |resource| resource['kind'] == 'group' }
        user_kind_json_response = json_response.find { |resource| resource['kind'] == 'user' }

        expect(response).to have_gitlab_http_status(200)
        expect(response).to include_pagination_headers
        expect(group_kind_json_response.keys).to contain_exactly('id', 'kind', 'name', 'path', 'full_path',
                                                                 'parent_id', 'members_count_with_descendants',
                                                                 'plan', 'shared_runners_minutes_limit')

        expect(user_kind_json_response.keys).to contain_exactly('id', 'kind', 'name', 'path', 'full_path',
                                                                'parent_id', 'plan', 'shared_runners_minutes_limit')
      end

      it "admin: returns an array of all namespaces" do
        get api("/namespaces", admin)

        expect(response).to have_gitlab_http_status(200)
        expect(response).to include_pagination_headers
        expect(json_response).to be_an Array
        expect(json_response.length).to eq(Namespace.count)
      end

      it "admin: returns an array of matched namespaces" do
        get api("/namespaces?search=#{group2.name}", admin)

        expect(response).to have_gitlab_http_status(200)
        expect(response).to include_pagination_headers
        expect(json_response).to be_an Array
        expect(json_response.length).to eq(1)
        expect(json_response.last['path']).to eq(group2.path)
        expect(json_response.last['full_path']).to eq(group2.full_path)
      end
    end

    context "when authenticated as a regular user" do
      it "returns correct attributes when user can admin group" do
        group1.add_owner(user)

        get api("/namespaces", user)

        owned_group_response = json_response.find { |resource| resource['id'] == group1.id }

        expect(owned_group_response.keys).to contain_exactly('id', 'kind', 'name', 'path', 'full_path',
                                                             'plan', 'parent_id', 'members_count_with_descendants')
      end

      it "returns correct attributes when user cannot admin group" do
        group1.add_guest(user)

        get api("/namespaces", user)

        guest_group_response = json_response.find { |resource| resource['id'] == group1.id }

        expect(guest_group_response.keys).to contain_exactly('id', 'kind', 'name', 'path', 'full_path', 'parent_id')
      end

      it "user: returns an array of namespaces" do
        get api("/namespaces", user)

        expect(response).to have_gitlab_http_status(200)
        expect(response).to include_pagination_headers
        expect(json_response).to be_an Array
        expect(json_response.length).to eq(1)
      end

      it "admin: returns an array of matched namespaces" do
        get api("/namespaces?search=#{user.username}", user)

        expect(response).to have_gitlab_http_status(200)
        expect(response).to include_pagination_headers
        expect(json_response).to be_an Array
        expect(json_response.length).to eq(1)
      end
    end
  end

  describe 'PUT /namespaces/:id' do
    context 'when authenticated as admin' do
      it 'updates namespace using full_path' do
        put api("/namespaces/#{group1.full_path}", admin), plan: 'silver', shared_runners_minutes_limit: 9001

        expect(response).to have_gitlab_http_status(200)
        expect(json_response['plan']).to eq('silver')
        expect(json_response['shared_runners_minutes_limit']).to eq(9001)
      end

      it 'updates namespace using id' do
        put api("/namespaces/#{group1.id}", admin), plan: 'silver', shared_runners_minutes_limit: 9001

        expect(response).to have_gitlab_http_status(200)
        expect(json_response['plan']).to eq('silver')
        expect(json_response['shared_runners_minutes_limit']).to eq(9001)
      end
    end

    context 'when not authenticated as admin' do
      it 'retuns 403' do
        put api("/namespaces/#{group1.id}", user), plan: 'silver'

        expect(response).to have_gitlab_http_status(403)
      end
    end

    context 'when namespace not found' do
      it 'returns 404' do
        put api("/namespaces/12345", admin), plan: 'silver'

        expect(response).to have_gitlab_http_status(404)
        expect(json_response).to eq('message' => '404 Namespace Not Found')
      end
    end

    context 'when invalid params' do
      it 'returns validation error' do
        put api("/namespaces/#{group1.id}", admin), plan: 'unknown'

        expect(response).to have_gitlab_http_status(400)
        expect(json_response['message']).to eq('plan' => ['is not included in the list'])
      end
    end
  end

  describe 'GET /namespaces/:id' do
    let(:owned_group) { group1 }

    shared_examples 'namespace reader' do
      before do
        owned_group.add_owner(request_actor)
      end

      context 'when namespace exists' do
        it 'returns namespace details' do
          get api("/namespaces/#{owned_group.id}", request_actor)

          expect(response).to have_gitlab_http_status(200)

          expect(json_response['id']).to eq(owned_group.id)
          expect(json_response['name']).to eq(owned_group.name)
        end
      end

      context "when namespace doesn't exist" do
        it 'returns not-found' do
          get api('/namespaces/9999', request_actor)

          expect(response).to have_gitlab_http_status(404)
        end
      end
    end

    context 'when unauthenticated' do
      it 'returns authentication error' do
        get api("/namespaces/#{group1.id}")

        expect(response).to have_gitlab_http_status(401)
      end
    end

    context 'when authenticated as regular user' do
      let(:request_actor) { user }

      context 'when requested namespace is not owned by user' do
        it 'returns authentication error' do
          get api("/namespaces/#{group2.id}", request_actor)

          expect(response).to have_gitlab_http_status(403)
        end
      end

      context 'when requested namespace is owned by user' do
        it_behaves_like 'namespace reader'
      end
    end

    context 'when authenticated as admin' do
      let(:request_actor) { admin }

      context 'when requested namespace is not owned by user' do
        it 'returns authentication error' do
          get api("/namespaces/#{group2.id}", request_actor)

          expect(response).to have_gitlab_http_status(200)
        end
      end

      context 'when requested namespace is owned by user' do
        it_behaves_like 'namespace reader'
      end
    end
  end
end

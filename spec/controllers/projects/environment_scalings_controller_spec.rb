require 'spec_helper'

describe Projects::EnvironmentScalingsController do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:environment) { create(:environment, project: project) }

  before do
    project.add_master(user)

    sign_in(user)
  end

  describe 'POST update' do
    subject { post :update, namespace_id: project.namespace.to_param, project_id: project, environment_id: environment, environment_scaling: scaling_params, format: :json }

    before do
      environment.create_scaling(replicas: 1)
    end

    context 'with valid parameters' do
      let(:scaling_params) { { replicas: '5' } }

      it 'responds with ok status code' do
        subject

        expect(response).to have_gitlab_http_status(:ok)
      end

      it 'updates the scaling options' do
        expect { subject }.to change { environment.reload.scaling.replicas }.to(5)
      end
    end

    context 'with an invalid parameter' do
      let(:scaling_params) { { replicas: 'hello' } }

      it 'responds with bad_request status code' do
        subject

        expect(response).to have_gitlab_http_status(:bad_request)
      end

      it 'does not update the scaling options' do
        expect { subject }.not_to change { environment.reload.scaling.replicas }
      end
    end
  end
end

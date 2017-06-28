require 'spec_helper'

describe Projects::PipelineSchedulesController do
  include AccessMatchersForController

  set(:project) { create(:empty_project, :public) }
  let!(:pipeline_schedule) { create(:ci_pipeline_schedule, project: project) }

  describe 'GET #index' do
    let(:scope) { nil }
    let!(:inactive_pipeline_schedule) do
      create(:ci_pipeline_schedule, :inactive, project: project)
    end

    it 'renders the index view' do
      visit_pipelines_schedules

      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
    end

    context 'when the scope is set to active' do
      let(:scope) { 'active' }

      before do
        visit_pipelines_schedules
      end

      it 'only shows active pipeline schedules' do
        expect(response).to have_http_status(:ok)
        expect(assigns(:schedules)).to include(pipeline_schedule)
        expect(assigns(:schedules)).not_to include(inactive_pipeline_schedule)
      end
    end

    def visit_pipelines_schedules
      get :index, namespace_id: project.namespace.to_param, project_id: project, scope: scope
    end
  end

  describe 'GET #new' do
    before do
      create(:user).tap do |user|
        project.add_developer(user)
        sign_in(user)
      end
    end

    it 'initializes a pipeline schedule model' do
      get :new, namespace_id: project.namespace.to_param, project_id: project

      expect(response).to have_http_status(:ok)
      expect(assigns(:schedule)).to be_a_new(Ci::PipelineSchedule)
    end
  end

  describe 'POST #create' do
    describe 'functionality' do
      before do
        create(:user).tap do |user|
          project.add_developer(user)
          sign_in(user)
        end
      end

      let(:basic_param) do
        { description: 'aaaaaaaa', cron: '0 4 * * *', cron_timezone: 'UTC', ref: 'master', active: '1' }
      end

      context 'when variables_attributes is empty' do
        let(:schedule) { basic_param }

        it 'creates a new schedule' do
          expect { go }
            .to change { Ci::PipelineSchedule.count }.by(1)
            .and change { Ci::PipelineScheduleVariable.count }.by(0)

          expect(response).to have_http_status(:found)
        end
      end

      context 'when variables_attributes has one variable' do
        let(:schedule) do
          basic_param.merge({
            variables_attributes: [{ key: 'AAA', value: 'AAA123' }]
          })
        end

        it 'creates a new schedule' do
          expect { go }
            .to change { Ci::PipelineSchedule.count }.by(1)
            .and change { Ci::PipelineScheduleVariable.count }.by(1)

          expect(response).to have_http_status(:found)
          expect(Ci::PipelineScheduleVariable.last.key).to eq("AAA")
          expect(Ci::PipelineScheduleVariable.last.value).to eq("AAA123")
        end

        context 'when the same key has already been persisted' do
          it 'returns an error that the key of variable is invaild' do
            go

            pipeline_schedule_variable = build(:ci_pipeline_schedule_variable, key: 'AAA', pipeline_schedule: assigns(:schedule))
            expect(pipeline_schedule_variable).to be_invalid
          end
        end
      end

      context 'when variables_attributes has one variable and key is empty' do
        let(:schedule) do
          basic_param.merge({
            variables_attributes: [{ key: '', value: 'AAA123' }]
          })
        end

        it 'returns an error that the key of variable is invaild' do
          expect { go }
            .to change { Ci::PipelineSchedule.count }.by(0)
            .and change { Ci::PipelineScheduleVariable.count }.by(0)

          expect(assigns(:schedule).errors['variables.key']).not_to be_empty
        end
      end

      context 'when variables_attributes has two variables and unique' do
        let(:schedule) do
          basic_param.merge({
            variables_attributes: [{ key: 'AAA', value: 'AAA123' }, { key: 'BBB', value: 'BBB123' }]
          })
        end

        it 'creates a new schedule' do
          expect { go }
            .to change { Ci::PipelineSchedule.count }.by(1)
            .and change { Ci::PipelineScheduleVariable.count }.by(2)

          expect(response).to have_http_status(:found)
          expect(Ci::PipelineScheduleVariable.first.key).to eq("AAA")
          expect(Ci::PipelineScheduleVariable.first.value).to eq("AAA123")
          expect(Ci::PipelineScheduleVariable.last.key).to eq("BBB")
          expect(Ci::PipelineScheduleVariable.last.value).to eq("BBB123")
        end
      end

      # This test no longer passes, since we removed a custom validation
      # context 'when variables_attributes has two variables and duplicted' do
      #   let(:schedule) do
      #     basic_param.merge({
      #       variables_attributes: [{ key: 'AAA', value: 'AAA123' }, { key: 'AAA', value: 'BBB123' }]
      #     })
      #   end

      #   it 'returns an error that the keys of variable are duplicated' do
      #     expect { go }
      #       .to change { Ci::PipelineSchedule.count }.by(0)
      #       .and change { Ci::PipelineScheduleVariable.count }.by(0)

      #     expect(assigns(:schedule).errors['variables.key']).not_to be_empty
      #   end
      # end

      def go
        post :create, namespace_id: project.namespace.to_param, project_id: project, schedule: schedule
      end
    end

    describe 'security' do
      it { expect { go }.to be_allowed_for(:admin) }
      it { expect { go }.to be_allowed_for(:owner).of(project) }
      it { expect { go }.to be_allowed_for(:master).of(project) }
      it { expect { go }.to be_allowed_for(:developer).of(project) }
      it { expect { go }.to be_denied_for(:reporter).of(project) }
      it { expect { go }.to be_denied_for(:guest).of(project) }
      it { expect { go }.to be_denied_for(:user) }
      it { expect { go }.to be_denied_for(:external) }
      it { expect { go }.to be_denied_for(:visitor) }

      def go
        post :create, namespace_id: project.namespace.to_param,
                      project_id: project,
                      schedule: { description: 'aaaaaaaa', cron: '0 4 * * *',
                                  cron_timezone: 'UTC', ref: 'master',
                                  active: '1' }
      end
    end
  end

  describe 'PUT #update' do
    describe 'functionality' do
      let(:user) { create(:user) }
      let!(:pipeline_schedule) { create(:ci_pipeline_schedule, project: project, owner: user) }

      before do
        project.add_developer(user)

        sign_in(user)
      end

      context 'when a pipeline schedule has no variables' do
        let(:basic_param) do
          { description: 'updated_desc', cron: '0 1 * * *', cron_timezone: 'UTC', ref: 'patch-x', active: '1' }
        end

        context 'when params do not include variables' do
          let(:schedule) { basic_param }

          it 'updates only scheduled pipeline attributes' do
            go

            pipeline_schedule.reload

            expect(response).to have_http_status(:found)
            expect(pipeline_schedule.description).to eq('updated_desc')
            expect(pipeline_schedule.cron).to eq('0 1 * * *')
            expect(pipeline_schedule.cron_timezone).to eq('UTC')
            expect(pipeline_schedule.ref).to eq('patch-x')
            expect(pipeline_schedule.active).to eq(true)
            expect(pipeline_schedule.variables).to be_empty
          end
        end

        context 'when params include one variable' do
          let(:schedule) do
            basic_param.merge({
              variables_attributes: [{ key: 'AAA', value: 'AAA123' }]
            })
          end

          it 'inserts new variable to the pipeline schedule' do
            expect { go }.to change { Ci::PipelineScheduleVariable.count }.by(1)

            pipeline_schedule.reload

            expect(response).to have_http_status(:found)
            expect(pipeline_schedule.variables.last.key).to eq('AAA')
            expect(pipeline_schedule.variables.last.value).to eq('AAA123')
          end
        end

        context 'when params include two unique variables' do
          let(:schedule) do
            basic_param.merge({
              variables_attributes: [{ key: 'AAA', value: 'AAA123' }, { key: 'BBB', value: 'BBB123' }]
            })
          end

          it 'inserts two new variables to the pipeline schedule' do
            expect { go }.to change { Ci::PipelineScheduleVariable.count }.by(2)

            pipeline_schedule.reload

            expect(response).to have_http_status(:found)
            expect(pipeline_schedule.variables.first.key).to eq('AAA')
            expect(pipeline_schedule.variables.first.value).to eq('AAA123')
            expect(pipeline_schedule.variables.last.key).to eq('BBB')
            expect(pipeline_schedule.variables.last.value).to eq('BBB123')
          end
        end

        # This test no longer passes, since we removed a custom validation
        # context 'when params include two duplicated variables' do
        #   let(:schedule) do
        #     basic_param.merge({
        #       variables_attributes: [{ key: 'AAA', value: 'AAA123' }, { key: 'AAA', value: 'BBB123' }]
        #     })
        #   end

        #   it 'returns an error that variables are duplciated' do
        #     put :update, namespace_id: project.namespace.to_param,
        #       project_id: project, id: pipeline_schedule, schedule: schedule

        #     expect(assigns(:schedule).errors['variables.key']).not_to be_empty
        #   end
        # end
      end

      context 'when a pipeline schedule has one variable' do
        let(:basic_param) do
          { description: 'updated_desc', cron: '0 1 * * *', cron_timezone: 'UTC', ref: 'patch-x', active: '1' }
        end

        let!(:pipeline_schedule_variable) do
          create(:ci_pipeline_schedule_variable, key: 'CCC',
            pipeline_schedule: pipeline_schedule)
        end

        context 'when params do not include variables' do
          let(:schedule) { basic_param }

          it 'updates only scheduled pipeline attributes' do
            go

            pipeline_schedule.reload

            expect(response).to have_http_status(:found)
            expect(pipeline_schedule.description).to eq('updated_desc')
            expect(pipeline_schedule.cron).to eq('0 1 * * *')
            expect(pipeline_schedule.cron_timezone).to eq('UTC')
            expect(pipeline_schedule.ref).to eq('patch-x')
            expect(pipeline_schedule.active).to eq(true)
            expect(pipeline_schedule.variables.count).to eq(1)
            expect(pipeline_schedule.variables.last.key).to eq('CCC')
          end
        end

        context 'when params include one variable' do
          context 'when adds a new variable' do
            let(:schedule) do
              basic_param.merge({
                variables_attributes: [ { key: 'AAA', value: 'AAA123' }]
              })
            end

            it 'adds the new variable' do
              expect { go }.to change { Ci::PipelineScheduleVariable.count }.by(1)

              expect(pipeline_schedule.variables.last.key).to eq('AAA')
            end
          end

          context 'when updates a variable' do
            let(:schedule) do
              basic_param.merge({
                variables_attributes: [ { id: pipeline_schedule_variable.id, value: 'new_value' } ]
              })
            end

            it 'updates the variable' do
              expect { go }.not_to change { Ci::PipelineScheduleVariable.count }

              pipeline_schedule_variable.reload

              expect(pipeline_schedule_variable.value).to eq('new_value')
            end
          end

          context 'when deletes a variable' do
            let(:schedule) do
              basic_param.merge({
                variables_attributes: [ { id: pipeline_schedule_variable.id, _destroy: true } ]
              })
            end

            it 'delete the existsed variable' do
              expect { go }.to change { Ci::PipelineScheduleVariable.count }.by(-1)
            end
          end
        end
      end

      def go
        put :update, namespace_id: project.namespace.to_param,
                     project_id: project, id: pipeline_schedule,
                     schedule: schedule
      end
    end

    describe 'security' do
      context 'when a developer created a pipeline schedule' do
        let(:developer_1) { create(:user) }
        let!(:pipeline_schedule) { create(:ci_pipeline_schedule, project: project, owner: developer_1) }

        before do
          project.add_developer(developer_1)
        end

        context 'when the developer updates' do
          it { expect { go }.to be_allowed_for(developer_1) }
        end

        context 'when another developer updates' do
          it { expect { go }.to be_denied_for(:developer).of(project) }
        end

        context 'when a master updates' do
          it { expect { go }.to be_allowed_for(:master).of(project) }
        end
      end

      context 'when a master created a pipeline schedule' do
        let(:master_1) { create(:user) }
        let!(:pipeline_schedule) { create(:ci_pipeline_schedule, project: project, owner: master_1) }

        before do
          project.add_master(master_1)
        end

        context 'when the master updates' do
          it { expect { go }.to be_allowed_for(master_1) }
        end

        context 'when other masters updates' do
          it { expect { go }.to be_allowed_for(:master).of(project) }
        end

        context 'when a developer updates' do
          it { expect { go }.to be_denied_for(:developer).of(project) }
        end
      end
    end

    def go
      put :update, namespace_id: project.namespace.to_param,
                   project_id: project, id: pipeline_schedule,
                   schedule: { description: 'updated_desc' }
    end
  end

  describe 'GET edit' do
    let(:user) { create(:user) }

    before do
      project.add_master(user)

      sign_in(user)
    end

    it 'loads the pipeline schedule' do
      get :edit, namespace_id: project.namespace.to_param, project_id: project, id: pipeline_schedule.id

      expect(response).to have_http_status(:ok)
      expect(assigns(:schedule)).to eq(pipeline_schedule)
    end
  end

  describe 'DELETE #destroy' do
    set(:user) { create(:user) }

    context 'when a developer makes the request' do
      before do
        project.add_developer(user)
        sign_in(user)

        delete :destroy, namespace_id: project.namespace.to_param, project_id: project, id: pipeline_schedule.id
      end

      it 'does not delete the pipeline schedule' do
        expect(response).not_to have_http_status(:ok)
      end
    end

    context 'when a master makes the request' do
      before do
        project.add_master(user)
        sign_in(user)
      end

      it 'destroys the pipeline schedule' do
        expect do
          delete :destroy, namespace_id: project.namespace.to_param, project_id: project, id: pipeline_schedule.id
        end.to change { project.pipeline_schedules.count }.by(-1)

        expect(response).to have_http_status(302)
      end
    end
  end
end

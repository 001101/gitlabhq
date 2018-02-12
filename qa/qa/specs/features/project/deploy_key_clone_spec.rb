require 'digest/sha1'

module QA
  feature 'cloning code using a deploy key', :core, :docker do
    let(:runner_name) { "qa-runner-#{Time.now.to_i}" }
    let(:key) { Runtime::RSAKey.new }

    given(:project) do
      Factory::Resource::Project.fabricate! do |resource|
        resource.name = 'deploy-key-clone-project'
      end
    end

    def fabricate_runner
      Factory::Resource::Runner.fabricate! do |resource|
        resource.project = project
        resource.name = runner_name
        resource.tags = %w[qa docker]
        resource.image = 'gitlab/gitlab-runner:ubuntu'
      end
    end

    def fabricate_deploy_key
      Factory::Resource::DeployKey.fabricate! do |resource|
        resource.project = project
        resource.title = 'deploy key title'
        resource.key = key.public_key
      end
    end

    def fabricate_secret_variable
      Factory::Resource::SecretVariable.fabricate! do |resource|
        resource.project = project
        resource.key = 'DEPLOY_KEY'
        resource.value = key.to_pem
      end
    end

    def fabricate_gitlab_ci
      repository_uri = Page::Project::Show.act do
        choose_repository_clone_ssh
        repository_location_uri
      end

      <<~YAML
        cat-config:
          script:
            - mkdir -p ~/.ssh
            - ssh-keyscan -p #{repository_uri.port} #{repository_uri.host} >> ~/.ssh/known_hosts
            - eval $(ssh-agent -s)
            - echo "$DEPLOY_KEY" | ssh-add -
            - git clone #{repository_uri.git_uri}
            - sha1sum #{project.name}/.gitlab-ci.yml
          tags:
            - qa
            - docker
      YAML
    end

    def fabricate_push(gitlab_ci)
      Factory::Repository::Push.fabricate! do |resource|
        resource.project = project
        resource.file_name = '.gitlab-ci.yml'
        resource.commit_message = 'Add .gitlab-ci.yml'
        resource.file_content = gitlab_ci
      end
    end

    after do
      Service::Runner.new(runner_name).remove!
    end

    scenario 'user sets up a deploy key to clone code using pipelines' do
      Runtime::Browser.visit(:gitlab, Page::Main::Login)
      Page::Main::Login.act { sign_in_using_credentials }

      fabricate_runner
      fabricate_deploy_key
      fabricate_secret_variable

      project.visit!

      gitlab_ci = fabricate_gitlab_ci
      fabricate_push(gitlab_ci)
      sha1sum = Digest::SHA1.hexdigest(gitlab_ci)

      Page::Project::Show.act { wait_for_push }
      Page::Menu::Side.act { click_ci_cd_pipelines }
      Page::Project::Pipeline::Index.act { go_to_latest_pipeline }
      Page::Project::Pipeline::Show.act { go_to_first_job }

      Page::Project::Job::Show.perform do |job|
        expect(job.output).to include(sha1sum)
      end
    end
  end
end

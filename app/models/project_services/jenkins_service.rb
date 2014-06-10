# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  type        :string(255)
#  title       :string(255)
#  token       :string(255)
#  project_id  :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#  active      :boolean          default(FALSE), not null
#  project_url :string(255)
#  subdomain   :string(255)
#  room        :string(255)
#  recipients  :text
#  api_key     :string(255)
#

class JenkinsService < CiService
  attr_accessible :project_url

  validates :project_url, presence: true, if: :activated?

  delegate :execute, to: :service_hook, prefix: nil

  after_save :compose_service_hook, if: :activated?

  def compose_service_hook
    hook = service_hook || build_service_hook
    jenkins_url = project_url.sub(/job\/.*/, '')
    hook.url = jenkins_url + "/gitlab/build_now"
    hook.save
  end

  def title
    'Jenkins CI'
  end

  def description
    'An extendable open source continuous integration server'
  end

  def help
    'You must have installed GitLab Hook plugin into Jenkins.'
  end

  def to_param
    'jenkins'
  end

  def fields
    [
      { type: 'text', name: 'project_url', placeholder: 'Jenkins project URL like http://jenkins.example.com/job/my-project/' }
    ]
  end

  def build_page sha
    project_url + "/scm/bySHA1/#{sha}"
  end

  def commit_status sha
    response = HTTParty.get(build_page(sha), verify: false)

    if response.code == 200
      if response.include?('alt="Success"')
        'success'
      elsif response.include?('alt="Failed"') || response.include?('alt="Aborted"')
        'failed'
      elsif response.include?('alt="In progress"')
        'running'
      else
        'pending'
      end
    else
      :error
    end
  end
end

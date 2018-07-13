module BitbucketServer
  class Connection
    include ActionView::Helpers::SanitizeHelper

    DEFAULT_API_VERSION = '1.0'.freeze

    attr_reader :api_version, :base_uri, :username, :token

    ConnectionError = Class.new(StandardError)

    def initialize(options = {})
      @api_version   = options.fetch(:api_version, DEFAULT_API_VERSION)
      @base_uri      = options[:base_uri]
      @username      = options[:user]
      @token         = options[:password]
    end

    def get(path, extra_query = {})
      response = Gitlab::HTTP.get(build_url(path),
                                  basic_auth: auth,
                                  query: extra_query)

      check_errors!(response)

      response.parsed_response
    end

    def post(path, body)
      response = Gitlab::HTTP.post(build_url(path),
                        basic_auth: auth,
                        headers: post_headers,
                        body: body)

      check_errors!(response)

      response.parsed_response
    end

    # We need to support two different APIs for deletion:
    #
    # /rest/api/1.0/projects/{projectKey}/repos/{repositorySlug}/branches/default
    # /rest/branch-utils/1.0/projects/{projectKey}/repos/{repositorySlug}/branches
    def delete(resource, path, body)
      url = delete_url(resource, path)

      response = Gitlab::HTTP.delete(url,
                        basic_auth: auth,
                        headers: post_headers,
                        body: body)

      check_errors!(response)

      response.parsed_response
    end

    private

    def check_errors!(response)
      return if response.code >= 200 && response.code < 300

      details =
        if response.parsed_response && response.parsed_response.is_a?(Hash)
          sanitize(response.parsed_response.dig('errors', 0, 'message'))
        end

      message = "Error #{response.code}"
      message += ": #{details}" if details
      raise ConnectionError, message
    end

    def auth
      @auth ||= { username: username, password: token }
    end

    def post_headers
      @post_headers ||= { 'Content-Type' => 'application/json' }
    end

    def build_url(path)
      return path if path.starts_with?(root_url)

      "#{root_url}#{path}"
    end

    def root_url
      "#{base_uri}/rest/api/#{api_version}"
    end

    def delete_url(resource, path)
      if resource == :branches
        "#{base_uri}/branch-utils/#{api_version}#{path}"
      else
        build_url(path)
      end
    end
  end
end

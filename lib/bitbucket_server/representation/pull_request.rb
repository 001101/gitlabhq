module BitbucketServer
  module Representation
    class PullRequest < Representation::Base
      def author
        raw.dig('author', 'user', 'name')
      end

      def author_email
        raw.dig('author', 'user', 'emailAddress')
      end

      def description
        raw['description']
      end

      def iid
        raw['id']
      end

      def state
        if raw['state'] == 'MERGED'
          'merged'
        elsif raw['state'] == 'DECLINED'
          'closed'
        else
          'opened'
        end
      end

      def merged?
        state == 'merged'
      end

      def created_at
        Time.at(created_date / 1000) if created_date.is_a?(Integer)
      end

      def updated_at
        Time.at(updated_date / 1000) if created_date.is_a?(Integer)
      end

      def title
        raw['title']
      end

      def source_branch_name
        dig('fromRef', 'id')
      end

      def source_branch_sha
        dig('fromRef', 'latestCommit')
      end

      def target_branch_name
        dig('toRef', 'id')
      end

      def target_branch_sha
        dig('toRef', 'latestCommit')
      end

      private

      def created_date
        raw['createdDate']
      end

      def updated_date
        raw['updatedDate']
      end
    end
  end
end

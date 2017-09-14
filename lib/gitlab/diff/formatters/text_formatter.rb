module Gitlab
  module Diff
    module Formatters
      class TextFormatter < BaseFormatter
        attr_reader :old_line
        attr_reader :new_line

        def initialize(attrs)
          @old_line = attrs[:old_line]
          @new_line = attrs[:new_line]

          super(attrs)
        end

        def key
          @key ||= super.push(old_line, new_line)
        end

        def complete?
          old_line || new_line
        end

        def to_h
          super.merge(old_line: old_line, new_line: new_line)
        end

        def position_type
          :text
        end
      end
    end
  end
end

module Eyemask
  module Core

    class Loader

      def initialize(options={})
        @options = options
        @contents = []
      end

      def load(uri, data)
        @contents.concat(to_elements(uri, data))
      end

      def done
        # DO NOTHING, HERE AS A HOOK
      end

      def document
        doc = {}
        doc["contents"] = contents
        doc["title"] = @options[:title]
        doc["subtitle"] = @options[:subtitle]
        doc["authors"] = @options[:authors]
        doc["logo"] = @options[:logo]
        doc["params"] = @options[:params]
        doc
      end

      def contents
        @contents.sort{|a, b| a["uri"] <=> b["uri"] }
      end

      private

      def to_elements(uri, data)
        begin
          JSON.parse(data)
        rescue JSON::ParserError
          []
        end
      end

    end

  end
end
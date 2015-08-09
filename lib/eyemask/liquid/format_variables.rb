require 'liquid'
require 'rouge'

module Eyemask
  module Liquid
    module FormatVariables

      VARIABLE_REGEX = /<([^&]+)>/

      def format_variables(input, cls)
        input.gsub(VARIABLE_REGEX) {|match| "<em class=\"#{cls}\">&lt;#{VARIABLE_REGEX.match(match)[1]}&gt;</em>"}
      end

    end
  end
end

Liquid::Template.register_filter(Eyemask::Liquid::FormatVariables)

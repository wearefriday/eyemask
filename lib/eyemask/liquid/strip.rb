require 'liquid'

module Eyemask
  module Liquid
    module Strip
      def strip(input)
        input.strip
      end
    end
  end
end

Liquid::Template.register_filter(Eyemask::Liquid::Strip)

require 'liquid'

module Eyemask
  module Liquid
    module Blockquote
      def blockquote(input)
        input.gsub(/^/, ">")
      end
    end
  end
end

Liquid::Template.register_filter(Eyemask::Liquid::Blockquote)
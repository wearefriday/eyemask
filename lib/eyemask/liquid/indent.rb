require 'liquid'

module Eyemask
  module Liquid
    class Indent < Liquid::Block

      def initialize(tag_name, markup, tokens)
        super
        @indentation = markup.to_i
      end

      def render(context)
        prefix = " " * @indentation
        super.gsub(/^/, prefix)
      end

    end
  end
end

Liquid::Template.register_tag('indent', Eyemask::Liquid::Indent)
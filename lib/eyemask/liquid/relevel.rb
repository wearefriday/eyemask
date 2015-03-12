require 'liquid'

module Eyemask
  module Liquid
    module RelevelFilter
      def relevel(input, markup)
        hash_prefix = "\#" * markup.to_i
        input.gsub(/^(#+) (.*)$/, "#{hash_prefix}\\1 \\2")
      end
    end

    class Relevel < Liquid::Block

      def initialize(tag_name, markup, tokens)
        super
        @num_up = markup.to_i
      end

      def render(context)
        hash_prefix = "\#" * @num_up
        super.gsub(/^(#+) (.*)$/, "#{hash_prefix}\\1 \\2")
      end

    end
  end
end

Liquid::Template.register_filter(Eyemask::Liquid::RelevelFilter)
Liquid::Template.register_tag('relevel', Eyemask::Liquid::Relevel)
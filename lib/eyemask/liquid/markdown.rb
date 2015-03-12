require 'liquid'
require 'redcarpet'

module Eyemask
  module Liquid
    module Markdown
      MARKDOWN = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true, footnotes: false, fenced_code_blocks:true, no_intra_emphasis: true, superscript: true, underline: true, highlight: true)

      def markdown(input)
        MARKDOWN.render(input)
      end
    end
  end
end

Liquid::Template.register_filter(Eyemask::Liquid::Markdown)

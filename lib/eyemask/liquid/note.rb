require 'liquid'

module Eyemask
  module Liquid
    class Note < ::Liquid::Block

      MARKDOWN = Redcarpet::Markdown.new(Eyemask::Liquid::Markdown::HTML.new(hard_wrap: true), autolink: true, tables: true, footnotes: false, fenced_code_blocks:true, no_intra_emphasis: true, superscript: true, underline: true, highlight: true)

      def initialize(tag_name, markup, tokens)
        super
        params = markup.split(" ")
        @note_class = params.first
        @note_data = params.drop(1).join(" ")
      end

      def render(context)
        content = MARKDOWN.render(::Liquid::Template.parse(super).render(context.registers))
        "<aside class=\"note note-#{@note_class}\" data-note=\"#{@note_data}\">#{content}</aside>"
      end

    end
  end
end

Liquid::Template.register_tag('note', Eyemask::Liquid::Note)
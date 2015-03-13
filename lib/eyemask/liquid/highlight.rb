require 'liquid'
require 'rouge'

module Eyemask
  module Liquid
    module Highlight

      def highlight(input, lang)
        formatter = Rouge::Formatters::HTML.new(inline_theme: "github")
        lexer = Rouge::Lexer.find(lang)
        unless lexer.nil?
          formatter.format(lexer.lex(input))
        else
          "<pre class=\"docstring\">#{input}</pre>"
        end
      end

    end
  end
end

Liquid::Template.register_filter(Eyemask::Liquid::Highlight)

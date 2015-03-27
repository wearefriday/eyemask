require 'json'
require 'liquid'

module Eyemask
  module Core
    class Converter

      def initialize(initiaizer_options={})
        @template = ::Liquid::Template.parse(template(initiaizer_options[:template]))
      end

      def convert(document)
        @template.render(document, registers: document).strip
      end

      def template(template)
        case template
        when "markdown"
          File.open(template_file("markdown.md")).read
        when "princexml"
          File.open(template_file("princexml.html")).read
        when "slides"
          File.open(template_file("slides.html")).read
        else
          File.open(File.expand_path(template)).read
        end
      end

      def template_file(filename)
        File.join(File.dirname(File.expand_path(__FILE__)), "../../../templates/#{filename}")
      end

    end
  end
end
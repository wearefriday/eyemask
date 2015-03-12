require 'liquid'
require 'base64'

module Eyemask

  module Liquid

    class Uml < ::Liquid::Block

      def initialize(tag_name, markup, tokens)
        super
      end

      def render(context)
        "\n\n<figure><img class=\"resolution-print\" src=\"#{get_data_uri_for_diagram(super)}\"></figure>\n\n"
      end

      def get_data_uri_for_diagram(diagram)
        data = parse_diagram(diagram)
        "data:image/png;base64,#{Base64.encode64(data)}"
      end

      def parse_diagram(diagram)
        output = ""
        IO.popen(["plantuml", "-pipe"], 'r+') do |f|
          f.puts("skinparam backgroundColor transparent")
          f.puts("skinparam shadowing false")
          f.puts("skinparam dpi 300")
          f.puts(diagram)
          f.close_write
          output = f.read
        end
        output
      end

    end
  end
end

Liquid::Template.register_tag('uml', Eyemask::Liquid::Uml)

require 'liquid'
require 'base64'

module Eyemask

  module Liquid

    class Uml < ::Liquid::Block

      def initialize(tag_name, markup, tokens)
        @tag_name = tag_name
        super
      end

      def render(context)
        "\n\n<figure><img class=\"resolution-#{resolution}\" src=\"#{get_data_uri_for_diagram(super)}\"></figure>\n\n"
      end

      def get_data_uri_for_diagram(diagram)
        data = parse_diagram(diagram)
        "data:image/png;base64,#{Base64.encode64(data)}"
      end

      def parse_diagram(diagram)
        output = ""
        IO.popen(["plantuml", "-pipe"], 'r+') do |f|
          f.puts("@start#{diagram_type}")
          case diagram_type
          when "uml"
            f.puts("skinparam backgroundColor transparent")
            f.puts("skinparam shadowing false")
            f.puts("skinparam dpi 300")
          end
          f.puts(diagram)
          f.puts("@end#{diagram_type}")
          f.close_write
          output = f.read
        end
        output
      end

      def resolution
        case diagram_type
        when "uml"
          "print"
        else
          "normal"
        end
      end

      def diagram_type
        case @tag_name
        when "uml"
          "uml"
        when "ditaa"
          "ditaa"
        when "salt"
          "salt"
        else
          "uml"
        end
      end

    end

  end
end

Liquid::Template.register_tag('uml', Eyemask::Liquid::Uml)
Liquid::Template.register_tag('ditaa', Eyemask::Liquid::Uml)
Liquid::Template.register_tag('salt', Eyemask::Liquid::Uml)
Liquid::Template.register_tag('dot', Eyemask::Liquid::Uml)

require 'json'
require 'liquid'

module Eyemask

  class Converter

    def initialize(initiaizer_options={})
      @template = ::Liquid::Template.parse(template(initiaizer_options[:template]))
    end

    def convert(contents, options={})
      if contents != ""
        params = render_params(contents,options)
        @template.render(params, registers: params).strip
      end
    end

    def template(template)
      case template
      when "markdown"
        File.open(template_file("markdown.md")).read
      when "princexml"
        File.open(template_file("princexml.html")).read
      else
        File.open(File.expand_path(template)).read
      end
    end

    def template_file(filename)
      File.join(File.dirname(File.expand_path(__FILE__)), "../../templates/#{filename}")
    end

    def render_params(contents, options)
      params = {}
      params["contents"] = features_from_json(contents)
      params["title"] = options[:title]
      params["subtitle"] = options[:subtitle]
      params["author"] = options[:author]
      params["params"] = options[:params]
      params
    end

    def features_from_json(contents)
      JSON.parse(contents).sort{|a, b| a["uri"] <=> b["uri"] }
    end

  end
end
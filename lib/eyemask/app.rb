require "thor"

module Eyemask

  class App < Thor

    desc "process", "Process a Cucumber JSON file to Markdown"
    method_option "title", desc: "Set a custom title for the document", default: "Specification"
    method_option "subtitle", desc: "Set a custom subtitle for the document"
    method_option "template", desc: "A custom Liquid template for rendering the output", default: "markdown"
    method_option "params", desc: "A set of custom parameters coded as key:value", type: :hash, default: {}
    def process(file_name)
      init_opts = {}
      contents = File.open(file_name).read
      init_opts[:template] = options[:template]
      puts Converter.new(init_opts).convert(contents, options)
    end

  end

end
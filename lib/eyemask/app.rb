module Eyemask

  class App < Thor

    desc "process", "Process a Cucumber JSON file to Markdown"
    method_option "title", desc: "Set a custom title for the document"
    method_option "subtitle", desc: "Set a custom subtitle for the document"
    method_option "template", desc: "A custom Liquid template for rendering the output"
    method_option "params", desc: "A set of custom parameters coded as key:value", type: :hash, default: {}
    def process(file_name)
      init_opts = {}
      contents = File.open(file_name).read
      init_opts[:template] = File.open(File.expand_path(options[:template])).read if options[:template]
      puts Converter.new(init_opts).convert(contents, options)
    end

  end

end
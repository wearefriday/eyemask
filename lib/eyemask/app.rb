require "thor"

module Eyemask

  class App < Thor

    desc "process", "Process one or more Cucumber JSON files to Markdown"
    method_option "title", desc: "Set a custom title for the document", default: "Specification"
    method_option "subtitle", desc: "Set a custom subtitle for the document"
    method_option "authors", desc: "Set a list of authors for the document", type: :array, default: []
    method_option "logo", desc: "Provide a URL for a logo that can be used in templates"
    method_option "template", desc: "A custom Liquid template for rendering the output", default: "markdown"
    method_option "params", desc: "A set of custom parameters coded as key:value", type: :hash, default: {}
    def process(*file_names)
      init_opts = {}
      loader = Eyemask::Core::Loader.new(options)
      file_names.each do |file|
        loader.load(file, contents(file))
      end
      loader.done
      
      init_opts[:template] = options[:template]

      puts Eyemask::Core::Converter.new(init_opts).convert(loader.document)
    end

    no_commands do

      def contents(file_name)
        case file_name
        when "-"
          STDIN.read
        else
          File.open(file_name).read
        end
      end

    end

  end

end
require 'json'
require 'liquid'

module Eyemask

  class Converter

    ONE_PAGE_TEMPLATE = <<-EOF.gsub(/^ {6}/, '')
      ---
      title: {{title}}
      {%if subtitle %}subtitle: {{subtitle}} {% endif %}
      ---

      # Features

      {% if contents == empty %}
      No features have been specified.
      {% endif %}

      {% for feature in contents %}
      ## {{feature.name}}

      {% relevel 2 %}
      {{feature.description | uml }}
      {% endrelevel %}

      {% for scenario in feature.elements %}
      ### {{ scenario.name }}

      {% relevel 3 %}
      {{scenario.description | uml }}
      {% endrelevel %}

      {% for step in scenario.steps %}
        - **{{step.keyword | strip}}** {{step.name}}
      {% if step.doc_string %}{% indent 4 %}
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      {{ step.doc_string.value }}
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      {% endindent %}{% endif %}
      {% if step.rows %}{% indent 4 %}{% for row in step.rows %}
        | {% for cell in row.cells %}{{ cell }} | {% endfor %}{% if forloop.first %}
        |{% for i in row.cells %}---|{% endfor %}{% endif %}{% endfor %}{% endindent %}{% endif %}
      {% endfor %}

      {% endfor %}

      {% endfor %}
    EOF

    def initialize(initiaizer_options={})
      template = initiaizer_options[:template]
      if template
        @template = ::Liquid::Template.parse(template)
      else
        @template = ::Liquid::Template.parse(ONE_PAGE_TEMPLATE)
      end
    end

    def convert(contents, options={})
      if contents != ""
        params = render_params(contents,options)
        @template.render(params, registers: params).strip
      end
    end

    def render_params(contents, options)
      params = {}
      params["contents"] = features_from_json(contents)
      params["title"] = options[:title] ? options[:title] : "Specification"
      params["subtitle"] = options[:subtitle] ? options[:subtitle] : nil
      params["params"] = options[:params]
      params
    end

    def features_from_json(contents)
      JSON.parse(contents).sort{|a, b| a["uri"] <=> b["uri"] }
    end

  end
end
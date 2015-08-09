---
title: {{title}}
{%if subtitle %}subtitle: {{subtitle}} {% endif %}
{%unless authors.empty %}author: {% for author in authors %}{{author}}{%unless forloop.last %}, {% endunless %}{% endfor %} {% endunless %}
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

{% if scenario.examples %}
{% for example in scenario.examples %}
#### Examples
{% for row in example.rows %}
| {% for cell in row.cells %}{{ cell }} | {% endfor %}{% endfor %}
{% endfor %}
{% endif %}

{% endfor %}

{% endfor %}
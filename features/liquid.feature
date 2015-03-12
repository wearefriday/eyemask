Feature: Liquid templates

  As with many things in software engineering, a little recursion can be useful. Our templates are written using Liquid. We also support running liquid across strings we interpolate into those templates, using Liquid's standard filter syntax.

  ~~~~ruby
  {% raw %}{{ some_string | parse | markdown }}{% endraw %}
  ~~~~

  The rough flow is as follows:

  {% uml %}

    start
    :Run string through Liquid;
    :Apply Markdown transformation;
    :Interpolate into generated document;
    end

  {% enduml %}

  As such, the output of the application of Liquid (in this example) should be valid Markdown.

  Scenario: Run Eyemask with Liquid interpolation
    Given a file named "cucumber_output.json" with:
      """json
      [
  {
    "keyword": "Feature",
    "name": "A test of a feature with Liquid filtering",
    "line": 1,
    "description": "{{params.myparam}}",
    "id": "a-test-of-a-liquid-feature",
    "uri": "features/liquid_feature.feature"
  }
]
    """
    And a file named "my_template.html" with:
      """
        <html>
          <body>
            {% for feature in contents %}
              {{ feature.description | parse }}
            {% endfor %}
          </body>
        </html>
      """
    When I run Eyemask on "cucumber_output.json" with the template: "my_template.html" and custom parameter "myparam" set to "Foo"
    Then the exit status should be 0
    And the output should contain: 
      """
      Foo
      """
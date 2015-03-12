Feature: Custom parameters
  When I run Eyemask with custom parameters set and a template that uses them
  I want to receive an output that uses those parameters
  So I can incorporate custom information into my templates

  Scenario: Run Eyemask supplying a template
    Given a file named "cucumber_output.json" with:
      """
        []
      """
    And a file named "my_template.html" with:
      """html
        <html>
          <body>
            <h1>{{ params.myparam }}</h1>
          </body>
        </html>
      """
    When I run Eyemask on "cucumber_output.json" with the template: "my_template.html" and custom parameter "myparam" set to "Foo"
    Then the exit status should be 0
    And the output should contain:
      """
      <h1>Foo</h1>
      """
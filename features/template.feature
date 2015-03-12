Feature: Custom templates
  When I run Eyemask with a template
  I want to receive the right output for that template
  So I can produce custom documentation types

  Scenario: Run Eyemask supplying a template
    Given a file named "cucumber_output.json" with:
      """json
        []
      """
    And a file named "my_template.html" with:
      """html
        <html>
          <body>
            <h1>{{ title }}</h1>
          </body>
        </html>
      """
    When I run Eyemask on "cucumber_output.json" with the template: "my_template.html"
    Then the exit status should be 0
    And the output should contain:
      """html
      <h1>Specification</h1>
      """

  Scenario: Run Eyemask with a named template
    Given a file named "cucumber_output.json" with:
      """json
        []
      """
    When I run Eyemask on "cucumber_output.json" with the template: "princexml"
    Then the exit status should be 0
    And the output should contain:
      """html
      <h1 class="doctitle">Specification</h1>
      """
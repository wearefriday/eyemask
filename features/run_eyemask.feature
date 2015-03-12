Feature: Run Eyemask
  When I run Eyemask on a Cucumber JSON file
  I want to receive a Markdown file containing the output of the specifications
  So I can produce a living documentation for the project

  Scenario: Run Eyemask on an empty file
    Given an empty file named "cucumber_output.json"
    When I run Eyemask on "cucumber_output.json"
    Then the exit status should be 0
    And the output should match:
       """
       """

  Scenario: Run Eyemask on a file containing no feature output
    Given a file named "cucumber_output.json" with:
      """
        [
        ]
      """
    When I run Eyemask on "cucumber_output.json"
    Then the exit status should be 0
    And the output should contain: 
      """
      No features have been specified.
      """

  Scenario: Run Eyemask supplying a title
    Given a file named "cucumber_output.json" with:
      """
        []
      """
    When I run Eyemask on "cucumber_output.json" with the title: "My Specification"
    Then the exit status should be 0
    And the output should contain:
      """
      title: My Specification
      """

  Scenario: Run Eyemask supplying a subtitle
    Given a file named "cucumber_output.json" with:
      """
        []
      """
    When I run Eyemask on "cucumber_output.json" with the subtitle: "My Subtitle"
    Then the exit status should be 0
    And the output should contain:
      """
      subtitle: My Subtitle
      """
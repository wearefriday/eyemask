Feature: Run Eyemask

  {% note story %}
  When I run Eyemask on a Cucumber JSON file
  I want to receive a Markdown file containing the output of the specifications
  So I can produce a living documentation for the project
  {% endnote %}

  Scenario: Run Eyemask on an empty file
  
    {% note questions %}
    - Should we output a warning to `STDERR` in case of no input?
    {% endnote %}

    Given an empty file named "cucumber_output.json"
    When I run Eyemask on "cucumber_output.json"
    Then the exit status should be 0
    And the output should match:
       """
       """

  Scenario: Run Eyemask on a file containing no feature output
    Given a file named "cucumber_output.json" with:
      """javascript
        [
        ]
      """
    When I run Eyemask on "cucumber_output.json"
    Then the exit status should be 0
    And the output should contain: 
      """markdown
      No features have been specified.
      """

  Scenario: Run Eyemask supplying a title
    Given a file named "cucumber_output.json" with:
      """javascript
        []
      """
    When I run Eyemask on "cucumber_output.json" with the title: "My Specification"
    Then the exit status should be 0
    And the output should contain:
      """markdown
      title: My Specification
      """

  Scenario: Run Eyemask supplying a subtitle
    Given a file named "cucumber_output.json" with:
      """javascript
        []
      """
    When I run Eyemask on "cucumber_output.json" with the subtitle: "My Subtitle"
    Then the exit status should be 0
    And the output should contain:
      """markdown
      subtitle: My Subtitle
      """

  Scenario: Run Eyemask supplying an author
    Given a file named "cucumber_output.json" with:
      """javascript
        []
      """
    When I run Eyemask on "cucumber_output.json" with the author: "John Smith"
    Then the exit status should be 0
    And the output should contain:
      """markdown
      author: John Smith
      """

  Scenario: Run Eyemask with the PrinceXML template supplying an author
    Given a file named "cucumber_output.json" with:
      """javascript
        []
      """
    When I run Eyemask on "cucumber_output.json" with the template "princexml" and the author: "John Smith"
    Then the exit status should be 0
    And the output should contain:
      """html
      <li>John Smith</li>
      """

  Scenario: Run Eyemask supplying multiple authors
    Given a file named "cucumber_output.json" with:
      """javascript
        []
      """
    When I run Eyemask on "cucumber_output.json" with the authors: "John Smith" and "Jane Doe"
    Then the exit status should be 0
    And the output should contain:
      """markdown
      author: John Smith, Jane Doe
      """

  Scenario: Run Eyemask with a logo
    Given a file named "cucumber_output.json" with:
      """javascript
        []
      """
    When I run Eyemask on "cucumber_output.json" with the template "princexml" and the logo: "my_logo.png"
    Then the exit status should be 0
    And the output should contain:
      """html
      <img alt="" src="my_logo.png">
      """

  Scenario: Run Eyemask accepting STDIN as input
    Given a file named "cucumber_output.json" with:
      """javascript
      [
        {
          "keyword": "Feature",
          "name": "A test of an empty feature",
          "line": 1,
          "description": "As a feature\nThis should be empty",
          "id": "a-test-of-an-empty-feature",
          "uri": "features/empty_feature.feature"
        }
      ]
      """
    When I pipe the file "cucumber_output.json" into Eyemask
    Then the exit status should be 0
    And the output should contain:
      """markdown
      A test of an empty feature
      """

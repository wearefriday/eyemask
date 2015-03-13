Feature: Features

  Scenario: Run Eyemask with a single feature without any scenarios
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
    When I run Eyemask on "cucumber_output.json"
    Then the exit status should be 0
    And the output should contain: 
      """markdown
      # Features
      """
    And the output should contain: 
      """markdown
      ## A test of an empty feature
      """
    And the output should contain:
      """markdown
      As a feature
      This should be empty
      """
    And the output should not contain:
      """markdown
      ###
      """

  Scenario: Support descriptions with Markdown headers
    Given a file named "cucumber_output.json" with:
      """javascript
      [
        {
          "keyword": "Feature",
          "name": "A test of an empty feature",
          "line": 1,
          "description": "As a feature\nThis should be empty\n\n# A subhead test\n\nLike this.",
          "id": "a-test-of-an-empty-feature",
          "uri": "features/empty_feature.feature"
        }
      ]
    """
    When I run Eyemask on "cucumber_output.json"
    Then the exit status should be 0
    And the output should contain:
      """markdown
      ### A subhead test
      """
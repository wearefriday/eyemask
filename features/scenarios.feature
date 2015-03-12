Feature: Scenarios

  Scenario: Display a block for each scenario in the JSON
    Given a file named "cucumber_output.json" with:
      """json
[     
  {
    "keyword": "Feature",
    "name": "A test of an empty scenario",
    "line": 1,
    "description": "As a feature\nThis should have one scenario",
    "id": "a-test-of-an-empty-scenario",
    "uri": "features/empty_scenario.feature",
    "elements": [
      {
        "keyword": "Scenario",
        "name": "Test scenario",
        "line": 5,
        "description": "This is a test scenario",
        "id": "a-test-of-an-empty-scenario;test-scenario",
        "type": "scenario"
      }
    ]
  }
]
    """
    When I run Eyemask on "cucumber_output.json"
    Then the exit status should be 0
    And the output should contain:
      """
      ### Test scenario
      """

  Scenario: Display the scenario description
    Given a file named "cucumber_output.json" with:
      """json
[     
  {
    "keyword": "Feature",
    "name": "A test of an empty scenario",
    "line": 1,
    "description": "As a feature\nThis should have one scenario",
    "id": "a-test-of-an-empty-scenario",
    "uri": "features/empty_scenario.feature",
    "elements": [
      {
        "keyword": "Scenario",
        "name": "Test scenario",
        "line": 5,
        "description": "This is a test scenario",
        "id": "a-test-of-an-empty-scenario;test-scenario",
        "type": "scenario"
      }
    ]
  }
]
    """
    When I run Eyemask on "cucumber_output.json"
    Then the exit status should be 0
    And the output should contain:
      """
      This is a test scenario
      """

  Scenario: Support Markdown headers in scenario descriptions
    Given a file named "cucumber_output.json" with:
      """json
[     
  {
    "keyword": "Feature",
    "name": "A test of an empty scenario",
    "line": 1,
    "description": "As a feature\nThis should have one scenario",
    "id": "a-test-of-an-empty-scenario",
    "uri": "features/empty_scenario.feature",
    "elements": [
      {
        "keyword": "Scenario",
        "name": "Test scenario",
        "line": 5,
        "description": "This is a test scenario\n\n# With a header\n\nAnd some text",
        "id": "a-test-of-an-empty-scenario;test-scenario",
        "type": "scenario"
      }
    ]
  }
]
    """
    When I run Eyemask on "cucumber_output.json"
    Then the exit status should be 0
    And the output should contain:
      """
      #### With a header
      """
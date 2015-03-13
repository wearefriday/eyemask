Feature: Steps

  Scenario: Display steps as a prose block
    Given a file named "cucumber_output.json" with:
      """javascript
      [
        {
          "keyword": "Feature",
          "name": "A test of an simple scenario",
          "line": 1,
          "description": "",
          "id": "a-test-of-an-simple-scenario",
          "uri": "features/simple_scenario.feature",
          "elements": [
            {
              "keyword": "Scenario",
              "name": "Test scenario",
              "line": 3,
              "description": "",
              "id": "a-test-of-an-simple-scenario;test-scenario",
              "type": "scenario",
              "steps": [
                {
                  "keyword": "Given ",
                  "name": "something is true",
                  "line": 4,
                  "match": {
                    "location": "features/simple_scenario.feature:4"
                  },
                  "result": {
                    "status": "undefined",
                    "duration": 327000
                  }
                },
                {
                  "keyword": "When ",
                  "name": "I do something",
                  "line": 5,
                  "match": {
                    "location": "features/simple_scenario.feature:5"
                  },
                  "result": {
                    "status": "undefined",
                    "duration": 326000
                  }
                },
                {
                  "keyword": "Then ",
                  "name": "something happens",
                  "line": 6,
                  "match": {
                    "location": "features/simple_scenario.feature:6"
                  },
                  "result": {
                    "status": "undefined",
                    "duration": 293000
                  }
                }
              ]
            }
          ]
        }
      ]
      """
    When I run Eyemask on "cucumber_output.json"
    Then the exit status should be 0
    And the output should contain:
      """markdown
      - **Given** something is true
      """
    And the output should contain:
      """markdown
      - **When** I do something
      """
    And the output should contain:
      """markdown
      - **Then** something happens
      """

  Scenario: Docstrings are converted to blockquotes
    Given a file named "cucumber_output.json" with:
      """javascript
      [
        {
          "keyword": "Feature",
          "name": "A test of an simple scenario",
          "line": 1,
          "description": "",
          "id": "a-test-of-an-simple-scenario",
          "uri": "features/docstring.feature",
          "elements": [
            {
              "keyword": "Scenario",
              "name": "Test scenario",
              "line": 3,
              "description": "",
              "id": "a-test-of-an-simple-scenario;test-scenario",
              "type": "scenario",
              "steps": [
                {
                  "keyword": "Given ",
                  "name": "the following:",
                  "line": 4,
                  "doc_string": {
                    "value": "  Some text\n here",
                    "content_type": "",
                    "line": 5
                  },
                  "match": {
                    "location": "features/docstring.feature:4"
                  },
                  "result": {
                    "status": "undefined",
                    "duration": 475000
                  }
                },
                {
                  "keyword": "When ",
                  "name": "I do something",
                  "line": 9,
                  "match": {
                    "location": "features/docstring.feature:9"
                  },
                  "result": {
                    "status": "undefined",
                    "duration": 301000
                  }
                },
                {
                  "keyword": "Then ",
                  "name": "something happens",
                  "line": 10,
                  "match": {
                    "location": "features/docstring.feature:10"
                  },
                  "result": {
                    "status": "undefined",
                    "duration": 270000
                  }
                }
              ]
            }
          ]
        }
      ]
      """
    When I run Eyemask on "cucumber_output.json"
    Then the exit status should be 0
    And the output should contain:
      """markdown
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      """
    And the output should contain:
      """markdown
      Some text
      """
    And the output should contain:
      """markdown
      here
      """

  Scenario: Render tables in steps appropriately
    Given a file named "cucumber_output.json" with:
      """javascript
      [
        {
          "keyword": "Feature",
          "name": "A test of an simple scenario",
          "line": 1,
          "description": "",
          "id": "a-test-of-an-simple-scenario",
          "uri": "features/tables.feature",
          "elements": [
            {
              "keyword": "Scenario",
              "name": "Test scenario",
              "line": 3,
              "description": "",
              "id": "a-test-of-an-simple-scenario;test-scenario",
              "type": "scenario",
              "steps": [
                {
                  "keyword": "Given ",
                  "name": "the following data:",
                  "line": 4,
                  "rows": [
                    {
                      "cells": [
                        "header1",
                        "header2"
                      ],
                      "line": 5
                    },
                    {
                      "cells": [
                        "this",
                        "that"
                      ],
                      "line": 6
                    },
                    {
                      "cells": [
                        "another",
                        "thing"
                      ],
                      "line": 7
                    }
                  ],
                  "match": {
                    "location": "features/tables.feature:4"
                  },
                  "result": {
                    "status": "undefined",
                    "duration": 1616000
                  }
                },
                {
                  "keyword": "When ",
                  "name": "I do something",
                  "line": 8,
                  "match": {
                    "location": "features/tables.feature:8"
                  },
                  "result": {
                    "status": "undefined",
                    "duration": 250000
                  }
                },
                {
                  "keyword": "Then ",
                  "name": "something happens",
                  "line": 9,
                  "match": {
                    "location": "features/tables.feature:9"
                  },
                  "result": {
                    "status": "undefined",
                    "duration": 262000
                  }
                }
              ]
            }
          ]
        }
      ]
      """
    When I run Eyemask on "cucumber_output.json"
    Then the exit status should be 0
    And the output should contain:
      """markdown
      | header1 | header2 |
      """
    And the output should contain:
      """markdown
      |---|---|
      """
    And the output should contain:
      """markdown
      | this | that |
      """
    And the output should contain:
      """markdown
      | another | thing |
      """
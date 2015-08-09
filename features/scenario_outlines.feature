Feature: Scenario outlines

  Scenario outlines allow you to provide variation of inputs with common steps. We display scenario outlines
  by showing the examples as a block after the steps.

  Scenario: Display a block for each scenario outline in the JSON
    Given a file named "cucumber_output.json" with:
      """javascript
        [
          {
              "keyword": "Feature",
              "name": "Example scenario outline",
              "line": 1,
              "description": "",
              "id": "example-scenario-outline",
              "uri": "features/scout.feature",
              "elements": [
                  {
                      "keyword": "Scenario Outline",
                      "name": "A test of outlines",
                      "line": 3,
                      "description": "",
                      "id": "example-scenario-outline;a-test-of-outlines",
                      "type": "scenario_outline",
                      "steps": [
                          {
                              "keyword": "Given ",
                              "name": "<foo> apples",
                              "line": 4,
                              "match": {
                                  "location": "features/scout.feature:6"
                              }
                          },
                          {
                              "keyword": "When ",
                              "name": "I eat an apple",
                              "line": 5
                          },
                          {
                              "keyword": "Then ",
                              "name": "there should be <bar> apples",
                              "line": 6
                          }
                      ],
                      "examples": [
                          {
                              "keyword": "Examples",
                              "name": "",
                              "line": 8,
                              "description": "",
                              "id": "example-scenario-outline;a-test-of-outlines;",
                              "rows": [
                                  {
                                      "cells": [
                                          "foo",
                                          "bar"
                                      ],
                                      "line": 9,
                                      "id": "example-scenario-outline;a-test-of-outlines;;1"
                                  },
                                  {
                                      "cells": [
                                          "2",
                                          "1"
                                      ],
                                      "line": 10,
                                      "id": "example-scenario-outline;a-test-of-outlines;;2"
                                  },
                                  {
                                      "cells": [
                                          "1",
                                          "0"
                                      ],
                                      "line": 11,
                                      "id": "example-scenario-outline;a-test-of-outlines;;3"
                                  },
                                  {
                                      "cells": [
                                          "0",
                                          "0"
                                      ],
                                      "line": 12,
                                      "id": "example-scenario-outline;a-test-of-outlines;;4"
                                  }
                              ]
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
      ### A test of outlines
      """
    And the output should contain:
      """markdown
      | foo | bar | 
      | 2 | 1 | 
      | 1 | 0 | 
      | 0 | 0 |
      """

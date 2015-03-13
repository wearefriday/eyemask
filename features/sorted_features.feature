Feature: Sorted Features

  Scenario: Running Eyemask with multiple features presorts them by their filename
    Given a file named "cucumber_output.json" with:
      """javascript
      [
        {
          "keyword": "Feature",
          "name": "Feature A",
          "line": 1,
          "description": "As a feature\nThis should be empty",
          "id": "feature-b",
          "uri": "features/2_feature_b.feature"
        },
        {
          "keyword": "Feature",
          "name": "Feature B",
          "line": 1,
          "description": "As a feature\nThis should be empty",
          "id": "feature-a",
          "uri": "features/1_feature_a.feature"
        }
      ]
      """
    And a file named "my_template.html" with:
      """html
      {% for feature in contents %}{{ feature.name }}
      {% endfor %}
      """
    When I run Eyemask on "cucumber_output.json" with the template: "my_template.html"
    Then the exit status should be 0
    And the output should contain: 
      """html
      Feature B
      Feature A
      """
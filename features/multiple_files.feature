Feature: Multiple files

  Users are able to run Eyemask over multiple files. This allows them to,
  for example, combine the results of multiple specification suites into a single
  document.

  Scenario: Run Eyemask over multiple JSON files

    Eyemask can accept multiple JSON files as arguments. These are presented
    as a list. Each file should use the Gherkin JSON serialisation.

    Given a file named "cucumber_1.json" with:
      """javascript
      [
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
    And a file named "cucumber_2.json" with:
      """javascript
      [
        {
          "keyword": "Feature",
          "name": "Feature A",
          "line": 1,
          "description": "As a feature\nThis should be empty",
          "id": "feature-b",
          "uri": "features/2_feature_b.feature"
        }
      ]
      """
    When I run Eyemask on "cucumber_1.json" and "cucumber_2.json"
    Then the exit status should be 0
    And the output should contain:
      """
      Feature B
      """
    And the output should contain:
      """
      Feature A
      """

  Scenario: Features from multiple files are sorted before display

    Whilst consuming multiple files, the features are combined and then sorted. This allows
    us to maintain a stable sort no matter how we divide up our specification suite.

    {% uml %}
    start

    repeat
      :Load file or stream;
      :Parse file to list of features;
    repeat while (Another file?)
    :Combine lists;
    :Sort array;

    stop
    {% enduml %}

    Given a file named "cucumber_1.json" with:
      """javascript
      [
        {
          "keyword": "Feature",
          "name": "Feature A",
          "line": 1,
          "description": "As a feature\nThis should be empty",
          "id": "feature-b",
          "uri": "features/2_feature_b.feature"
        }
      ]
      """
    And a file named "cucumber_2.json" with:
      """javascript
      [
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
    When I run Eyemask on "cucumber_1.json" and "cucumber_2.json" with the template "my_template.html"
    Then the exit status should be 0
    And the output should contain: 
      """
      Feature B
      Feature A
      """
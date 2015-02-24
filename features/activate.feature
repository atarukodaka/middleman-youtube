Feature: middleman-youtube is activated

  Scenario: Activate middleman-youtube
    Given a fixture app "empty-app"
    And a file named "config.rb" with:
      """
      activate :youtube, :width => 560
      """
    When I run `middleman build --verbose`
    Then the exit status should be 0
    And the output should not contain "Unknown Extension: youtube"

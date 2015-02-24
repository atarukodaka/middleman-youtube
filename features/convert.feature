Feature: convert youtube url

  Scenario: convert to iframe
    Given a fixture app "youtube-app"
    When I run `middleman build --verbose`
    Then the exit status should be 0
    And the file "build/index.html" should contain '<iframe width="560" height="315" src="https://www.youtube.com/embed/WIKqgE4BwAY" frameborder="0" allowfullscreen="true"></iframe>'

  Scenario: convert to iframe with width
    Given a fixture app "youtube-app"
    And a file named "config.rb" with:
      """
      activate :youtube, :width => 400
      """
    When I run `middleman build --verbose`
    Then the exit status should be 0
    And the file "build/index.html" should contain '<iframe width="400" height="225" src="https://www.youtube.com/embed/WIKqgE4BwAY" frameborder="0" allowfullscreen="true"></iframe>'

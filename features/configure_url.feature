Feature: Configure URLs to be tested

  Scenario: Single URL
    Given a file named "a11y.rb" with:
      """
      config = BBC::A11y::Configuration.new ['http://bbc.co.uk']
      BBC::A11y::Test.new(config).run
      """
    When I run `a11y`
    Then the exit status should be 0

  Scenario: Single bad URL
    Given a file named "a11y.rb" with:
      """
      config = BBC::A11y::Configuration.new ['godaddy.com']
      BBC::A11y::Test.new(config).run
      """
    When I run `a11y`
    Then the exit status should be 1


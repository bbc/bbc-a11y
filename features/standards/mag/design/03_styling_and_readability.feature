Feature: Styling and readability

  Core content must still be accessible when styling is unsupported or removed.

  Older mobile devices may have poor support for fonts, colours and styles.
  Additionally, assistive technology cannot draw meaning from styling. And some
  users will change settings (fonts, styles, colours, etc.) to suit their needs.

  A user must still be able to complete the core purpose of a page or screen,
  whether reading or taking action, when background colours, images, layout or
  features are missing. For example, read a news article, play a radio station
  or navigate elsewhere.

  If embedded media is not supported then a suitable message should be displayed
  instead.

  Background:
    Given I am performing a manual test of the "Design: Styling and readability: Core content must be accessible when styling is removed" standard
    And I have been asked "Is the core content of the page readable and usable without styling/CSS?"

  @html @manual
  Scenario: Manual pass
    When I answer "Yes"
    Then the manual test passes

  @html @manual
  Scenario: Manual fail
    When I answer "No"
    Then the manual test fails

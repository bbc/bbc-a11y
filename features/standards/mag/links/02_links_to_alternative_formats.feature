Feature: Links to alternative formats

  Links to alternative formats must indicate that an alternative is opening.

  Unexpectedly opening an item in another format and/or application could cause
  any user to become disoriented. This is especially relevant for users with
  cognitive impairments or using assistive technology.

  It is important to inform the user that they will be going to a different
  format and/or application and what that will be, so that they know what to
  expect and where they are.

  Background:
    Given I am performing a manual test of the "Links: Links to alternative formats: Links to alternative formats must indicate that an alternative is opening" standard
    And I have been asked "Do all links to alternative formats indicate that an alternative is opening?"

  Scenario: Links to alternative formats indicate that an alternative is opening (manual pass)
    When I answer "Yes (or not applicable)"
    Then the manual test passes

  Scenario: Links to alternative formats do not indicate that an alternative is opening (manual fail)
    When I answer "No"
    Then the manual test fails

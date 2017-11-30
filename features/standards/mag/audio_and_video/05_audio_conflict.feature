Feature: Audio conflict

  Narrative audio in games or interactive media should not talk over or conflict
  with native assistive technology.

  In order to interact with embedded media, users need to perceive the editorial
  narrative and/or instructions.

  If the embedded media is self-voicing content, then this should be hidden from
  the screen reader. If the embedded media is providing content to the screen
  reader, then this should not be self-voicing.

  Background:
    Given I am performing a manual test of the "Audio & Video: Audio conflict: Narrative audio should not conflict with assistive technology" standard
    And I have been asked "Is assistive technology uninterrupted by narrative audio?"

  @html @manual
  Scenario: Manual pass
    When I answer "Yes"
    Then the manual test passes

  @html @manual
  Scenario: Manual fail
    When I answer "No"
    Then the manual test fails

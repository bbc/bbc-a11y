Feature: Autoplay

  Audio must not play automatically unless the user is made aware this will
  happen or a pause/stop/mute button is provided.

  Audio in AV and interactive content can be disruptive for screen reader users
  because it can conflict with and speak over the screen reader. Unexpected
  audio may also distress users with cognitive or sensory sensitivity.

  Users should be given a choice to opt in for auto-playing content audio. Where
  a pause/stop/mute button is provided instead, it must be fully and immediately
  accessible.

  Where play automatically continues to the next content item, this must be
  indicated in an accessible way, with a choice to opt out and sufficient time
  to do so.

  User preferences should persist.

  Background:
    Given I am performing a manual test of the "Audio & Video: Autoplay: Audio must not play automatically without controls" standard
    And I have been asked "Does any audio that plays automatically make the user aware this will happen, or provide a pause/stop/mute button?"

  @html @manual
  Scenario: Manual pass
    When I answer "Yes"
    Then the manual test passes

  @html @manual
  Scenario: Manual fail
    When I answer "No"
    Then the manual test fails

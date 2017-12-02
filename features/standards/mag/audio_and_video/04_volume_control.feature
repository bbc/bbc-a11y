Feature: Volume control

  Separate volume controls should be provided for background music, ambient
  sounds, narrative and editorially significant sound effects.

  Separate volume controls, in addition to the mute control, should be provided
  in settings for interactive media, such as games, to minimise the risk of
  sensory overload for users with audio sensitivity:

  * Users with cognitive impairments that include audio sensitivity need to be
    able to minimise the risk of sensory shock.

  * Users with mild to moderate hearing impairment may need to adjust different
    audio elements to hear the narrative speech clearly.

  * Screen reader users need to be able to hear the screen reader over the
    sounds within interactive media.

  Background:
    Given I am performing a manual test of the "Audio & Video: Volume control: Volume controls should be provided for interactive media" standard
    And I have been asked "Are suitable volume controls provided for different audio layers in all interactive media?"

  @html @manual
  Scenario: Manual pass
    When I answer "Yes (or not applicable)"
    Then the manual test passes

  @html @manual
  Scenario: Manual fail
    When I answer "No"
    Then the manual test fails

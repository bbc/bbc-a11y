Feature: Appropriate triggers

  Actions must be triggered when appropriate for the type of user interaction.

  Users will use a variety of input methods, sending different signals that can
  be listened for programmatically to trigger actions. This could be moving a
  mouse, touching a screen or pressing a key. It could also be using other
  controllers or assistive technology to mimic these interactions.

  For mouse, touch and other pointer style interactions the most appropriate
  trigger will be a high level “click” event or an event at the end of the
  interaction. This allows users to change their mind and adjust focus, without
  being forced to commit to an action until the clicked mouse, or touch is
  removed.

  For keyboard style interactions the most appropriate trigger will be a high
  level “keypress” event or an event at the start of the interaction. These
  users have already chosen focus.

  Which trigger is most appropriate may vary for some interactive content.

  Background:
    Given I am performing a manual test of the "Focus: Appropriate triggers: Actions must be triggered when appropriate" standard
    And I have been asked "Are actions triggered when appropriate for the type of user interaction?"

  @html @manual
  Scenario: Actions triggered when appropriate for the type of user interaction (manual pass)
    When I answer "Yes"
    Then the manual test passes

  @html @manual
  Scenario: Actions not triggered when appropriate for the type of user interaction (manual fail)
    When I answer "No"
    Then the manual test fails

Feature: Flicker
  Content must not visibly or intentionally flicker or flash more than three
  times in any one-second period.

  Visual flicker, flashing and strobe lighting can affect anyone, but some users
  will be more susceptible than others. Symptoms may include eyestrain,
  dizziness, fatigue, headaches, migraine, and nausea. Users with medical
  conditions such as Ménière's or photosensitive epilepsy can be severely
  affected, experiencing vertigo, hearing loss and seizures.

  A well-documented example of the effects of flicker is Pokémon Shock.

  If flicker is unavoidable, the user must be warned before they reach the content.

  Where editorially appropriate, provide an alternative version of content that
  does not flicker but is as close to the original as possible.

  Background:
    Given I am performing a manual test of the "Design: Flicker: Content must not flicker or flash" standard
    And I have been asked "Does any content visibly or intentionally flicker or flash more than three times in any one-second period?"

  @html @manual
  Scenario: Manual pass
    When I answer "No"
    Then the manual test passes

  @html @manual
  Scenario: Manual fail
    When I answer "Yes"
    Then the manual test fails

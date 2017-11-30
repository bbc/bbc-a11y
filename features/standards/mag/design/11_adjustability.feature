Feature: Adjustability
  Interactive media, including games, should be adjustable for user ability and
  preference.

  Users of interactive media have differing abilities and preferences. Where
  appropriate, adjustment should be offered to make an experience inclusive and
  enable everyone to join in.

  For example, users in bright sunlight, experiencing a migraine, or with vision
  impairment may choose to adjust the contrast and text size, or enable a colour
  blind mode. Users in a noisy environment, needing quiet, or with hearing
  impairment may wish to adjust the volume or enabled subtitles. Users carrying
  something, nursing a hand injury, or with motor impairment may want to adjust
  the controls and pace. Younger users, those less familiar with technology, or
  with a cognitive impairment may adjust a difficulty level, use tutorials or
  enable hints.

  Tip: Consider the following:

  * Avoid complex controls and interactions.
  * Provide multiple ways to control interactions.
  * Provide means to adjust the number of choices.
  * Give the user control over speed and timeouts.
  * Provide means to adjust target area sizes.
  * Provide a specific accessible control scheme.
  * Respect device settings, such as text size.

  A game might additionally consider the following:

  * Make accessible modes available in practice tutorials.
  * Begin very easy for progressive complexity.
  * Offer ways to enhance character abilities.
  * Provide means to aid focus or aim using visual, audio and haptic cues.
  * Provide means to remove or reduce the number of obstacles.
  * Provide a single-hit no-fail mode.

  Background:
    Given I am performing a manual test of the "Design: Adjustability: Interactive media should be adjustable for user ability and preference" standard
    And I have been asked "Is any interactive media adjustable for user ability and preference?"

  @html @manual
  Scenario: Manual pass
    When I answer "Yes"
    Then the manual test passes

  @html @manual
  Scenario: Manual fail
    When I answer "No"
    Then the manual test fails

Feature: Controlling media

  Media that updates or animated content must have a pause, stop or hide
  control.

  Some users with cognitive impairments can find too much movement and change
  distracting and overwhelming. Users of assistive technology, such as screen
  readers, may not be aware of content updates and may not read the content
  before it changes.

  This guideline applies to any content, decoration or background that moves,
  updates, scrolls or blinks. The user must be able to stop, hide or pause
  changes, or updates must stop automatically after three cycles.

  An exception may be made, with sought advice, for:

  * short adverts or idents that play before AV content,
  * media that is playing fullscreen without other surrounding content,
  * the core content or mechanic of interactive content such as a game (though
    all background and non-editorially significant animation must have the
    option to be paused or disabled).

  Background:
    Given I am performing a manual test of the "Scripts and dynamic content: Controlling media: Media that updates and animation must have a pause, stop or hide control" standard
    And I have been asked "Does all media that updates or animated content have a pause, stop or hide control?"

  @html @manual
  Scenario: Media that updates and animation has a pause, stop or hide control (manual pass)
    When I answer "Yes (or not applicable)"
    Then the manual test passes

  @html @manual
  Scenario: Media that updates or animation has no pause, stop or hide control (manual fail)
    When I answer "No"
    Then the manual test fails

Feature: Instructions

  When needed, additional instructions should be provided to supplement visual
  and audio cues.

  Visual cues are not always obvious or visible to all users. In particular,
  screen reader users, users who magnify or zoom in on content, and cognitively
  impaired users.

  Similarly, audio cues are not always perceivable. In particular, to users who
  are deaf or hearing impaired, have volume diminished or muted, or are in noisy
  environments.

  Instructions, menus, dialogue and in-content messages should be delivered
  visually and audibly, at a user controlled speed, to help users understand how
  to interact with content. However, be aware that verbosity, whether visual or
  audible, can also be disorienting and try to be succinct.

  Tip: Accessible instructions might be:

  * Visible labels - such as on-screen labels for form controls;
  * Hidden text, text alternatives or labels - for screen reader users only;
  * Help instructions - such as a link to a text/audio file, or another
    section/page;
  * Temporarily hidden text - such as a pop-over hint or progressively expanded
    text;
  * Standard notifications - such as error messages.

  Background:
    Given I am performing a manual test of the "Editorial: Instructions: Additional instructions should be provided" standard
    And I have been asked "Are additional instructions provided to supplement visual and audio cues?"

  @html @manual
  Scenario: Manual pass
    When I answer "Yes (or not applicable)"
    Then the manual test passes

  @html @manual
  Scenario: Manual fail
    When I answer "No"
    Then the manual test fails

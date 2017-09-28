Feature: Decorative content

  Decorative images must be hidden from assistive technology.

  Hidden or inactive content that is, for example, behind other content such as
  a pop-over or side-drawer, should not be navigable for users of assistive
  technology as they may think they can interact with this content.

  This can be achieved by setting the appropriate properties or states on an
  element or object, so assistive technology is informed that it is off-screen,
  obscured, or hidden.

  Background:
    Given I am performing a manual test of the "Text equivalents: Decorative content: Decorative images must be hidden from assistive technology" standard
    And I have been asked "Are decorative images hidden from assistive technology?"

  Scenario: Decorative images hidden from assistive technology (manual pass)
    When I answer "Yes (or not applicable)"
    Then the manual test passes

  Scenario: Decorative images not hidden from assistive technology (manual fail)
    When I answer "No"
    Then the manual test fails

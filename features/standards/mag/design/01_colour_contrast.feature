Feature: Colour contrast

  The colour of text and background content must have sufficient contrast.

  Good colour contrast assists people with vision impairment, including colour
  blindness, and cognitive impairments when viewing content. It also
  accommodates lower specification devices with poor colour support and assists
  all users in a brightly lit environment.

  Good colour contrast is also essential when using colour as a differentiator,
  for example, when colour is used to indicate the presence of a link or a
  selected tab with text. The colour difference between the link text and
  non-link text must have sufficient contrast.

  In lieu of a proven colour contrast standard for mobile devices, the WCAG 2.0
  Level AA contrast ratio must be met or ideally exceeded. It requires a
  contrast of at least 4.5:1 for non-bold text smaller than 18pt.

  Background:
    Given I am performing a manual test of the "Design: Colour contrast: Colour combinations must pass the WCAG colour contrast check" standard
    And I have been asked "Do all colour combinations pass the Snook colour contrast check?"

  Scenario: Manual pass
    When I answer "Yes"
    Then the manual test passes

  Scenario: Manual fail
    When I answer "No"
    Then the manual test fails

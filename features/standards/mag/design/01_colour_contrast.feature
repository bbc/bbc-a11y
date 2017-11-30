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

  HTML Applicability
  ==================

  All colour combinations must pass the WCAG 2.0 AA-compliant colour contrast
  check in accordance with the Snook colour contrast checker.

  This is a ratio of 4.5:1 for text 18pt or less in size, and 3:1 for text
  larger than 18pt or text that is bold and larger than 14pt.

  Where it cannot be adapted, stylised text used in pre-existing broadcast
  logos and branding is exempt from this requirement.

  If there is sufficient contrast between foreground and background colours,
  particularly between text and its background but also applicable to the keys
  of graphs and similar, then users with moderately low vision or with colour
  deficiencies that affect contrast to a minor degree are more likely to be able
  to access BBC content without requiring additional assistive technologies.

  Background:
    Given I am performing a manual test of the "Design: Colour contrast: Colour combinations must pass the WCAG colour contrast check" standard
    And I have been asked "Do all colour combinations pass the Snook colour contrast check?"

  @html @manual
  Scenario: Manual pass
    When I answer "Yes"
    Then the manual test passes

  @html @manual
  Scenario: Manual fail
    When I answer "No"
    Then the manual test fails

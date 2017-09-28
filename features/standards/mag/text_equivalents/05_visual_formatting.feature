Feature: Visual formatting

  Visual formatting alone must not be used to convey meaning.

  People who are vision impaired may not perceive visual formatting, such as
  size, shape, location and colour, or attributes such as bold and italics.

  Visual formatting must not be the sole method of communicating information.
  Provide non-visual alternatives, such as semantic code, hidden text or
  accessibility labels. In particular, alternatives for predominantly visual
  components, such as maps, charts, and infographics, will need to suitably
  represent information in a non-visual way.

  Background:
    Given I am performing a manual test of the "Text equivalents: Visual formatting: Visual formatting alone must not be used to convey meaning" standard
    And I have been asked "Is visual formatting alone used to convey meaning?"

  Scenario: Non-visual alternatives provided (manual pass)
    When I answer "No"
    Then the manual test passes

  Scenario: Visual formatting alone used to convey meaning (manual fail)
    When I answer "Yes"
    Then the manual test fails

Feature: Containers and landmarks

  Containers should be used to describe page/screen structure, as supported by
  the platform.

  The visual layout of a page or screen groups elements to help people
  understand the structure of the content. Containers help assistive technology,
  such as screen readers, to describe groups of elements so that people who
  cannot see the visual layout can also understand the content structure. Screen
  reader users can also use containers and landmarks to quickly navigate within
  a page or screen.

  Semantic structural elements and/or ARIA landmarks are available for HTML.
  Structural containers are available for native apps.

  Background:
    Given I am performing a manual test of the "Structure: Containers and landmarks: Containers should be used to describe page structure" standard
    And I have been asked "Are containers used to describe page structure?"

  Scenario: Containers used to describe page structure (manual pass)
    When I answer "Yes"
    Then the manual test passes

  Scenario: Containers not used to describe page structure (manual fail)
    When I answer "No"
    Then the manual test fails

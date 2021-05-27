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

  HTML Applicability
  ==================

  A page **must** have exactly one element with `role="main"`

  The WAI-ARIA `main` landmark role can be help keyboard users with assistive
  technologies such as screen readers (and in the future as native browser
  functionality) to skip directly to the main content of a page, bypassing
  navigation and other contents that might be before it.

  @html @automated
  Scenario: Page has a single element with role of main
    Given a page with the body:
      """
      <div role="main">Main element</div>
      """
    When I test the "Structure: Containers and landmarks: Exactly one main landmark" standard
    Then it passes

  Scenario: Page has a single main element
    Given a page with the body:
      """
      <main>Main element</main>
      """
    When I test the "Structure: Containers and landmarks: Exactly one main landmark" standard
    Then it passes

  @html @automated
  Scenario: Page has two main elements
    Given a page with the body:
      """
      <div role="main">Main one</div>
      <div role="main">Main two</div>
      """
    When I test the "Structure: Containers and landmarks: Exactly one main landmark" standard
    Then it fails with the message:
      """
      Found 2 main elements (main or with role="main"): /html/body/div[1] /html/body/div[2]
      """

  @html @automated
  Scenario: Page has zero main elements
    Given a page with the body:
      """
      <div role="not-main">Main one</div>
      """
    When I test the "Structure: Containers and landmarks: Exactly one main landmark" standard
    Then it fails with the message:
      """
      Found 0 main elements (main or with role="main").
      """

  @html @manual
  Scenario: Containers used to describe page structure (manual pass)
    Given I am performing a manual test of the "Structure: Containers and landmarks: Containers should be used to describe page structure" standard
    And I have been asked "Are suitable containers used to help describe page structure?"
    When I answer "Yes"
    Then the manual test passes

  @html @manual
  Scenario: Containers not used to describe page structure (manual fail)
    Given I am performing a manual test of the "Structure: Containers and landmarks: Containers should be used to describe page structure" standard
    And I have been asked "Are suitable containers used to help describe page structure?"
    When I answer "No"
    Then the manual test fails

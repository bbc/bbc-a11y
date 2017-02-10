Feature: Display failing result

  Scenario: One standard fails
    Given a website running at http://localhost:54321
    When I run `bbc-a11y http://localhost:54321/missing_main_heading.html`
    Then it should fail with:
      """
      ✗ http://localhost:54321/missing_main_heading.html
        * Headings: Exactly one main heading
          - Found 0 h1 elements.

      For details on how to fix these errors, please see the following pages:
        - http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/headings.shtml
      """

  Scenario: Two failing checks from the same standard
    Given a website running at http://localhost:54321
    When I run `bbc-a11y http://localhost:54321/two_headings_failures.html`
    Then it should fail with:
      """
      ✗ http://localhost:54321/two_headings_failures.html
        * Headings: Content must follow headings
          - No content follows: /html/body/h2
        * Headings: Exactly one main heading
          - Found 0 h1 elements.

      For details on how to fix these errors, please see the following pages:
        - http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/headings.shtml
      """

  Scenario: Two failing checks from different standards
    Given a website running at http://localhost:54321
    When I run `bbc-a11y http://localhost:54321/heading_and_title_attribute_failures.html`
    Then it should fail with:
      """
      ✗ http://localhost:54321/heading_and_title_attribute_failures.html
        * Headings: Exactly one main heading
          - Found 0 h1 elements.
        * Title attributes: Title attributes only on inputs
          - Non-input element has title attribute: /html/body/p/span

      For details on how to fix these errors, please see the following pages:
        - http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/headings.shtml
        - http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/title-attributes.shtml
      """

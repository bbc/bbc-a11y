Feature: Display failing result

  Scenario: One standard fails
    Given a website running at http://localhost:54321
    When I run `bbc-a11y http://localhost:54321/missing_main_heading.html`
    Then it should fail with:
      """
      ✗ http://localhost:54321/missing_main_heading.html
        * Structure: Headings: Exactly one main heading
          - Found 0 h1 elements.

      For details on how to fix these errors, please see the following pages:
        - https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/headings
      """

  Scenario: One standard generates a warning
    Given a website running at http://localhost:54321
    When I run `bbc-a11y http://localhost:54321/subheading_first.html`
    Then it should fail with:
      """
      ✓ http://localhost:54321/subheading_first.html
        ⚠ Structure: Headings: Headings must be in ascending order
          - First heading was not a main heading: /html/body/h3

      For details on how to fix these errors, please see the following pages:
        - https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/headings
      """

  Scenario: Failures and warnings from the same standard
    Given a website running at http://localhost:54321
    When I run `bbc-a11y http://localhost:54321/two_headings_failures_and_one_warning.html`
    Then it should fail with:
      """
      ✗ http://localhost:54321/two_headings_failures_and_one_warning.html
        ⚠ Structure: Headings: Headings must be in ascending order
          - First heading was not a main heading: /html/body/h2
        * Structure: Headings: Exactly one main heading
          - Found 0 h1 elements.
        * Structure: Headings: Content must follow headings
          - No content follows: /html/body/h2

      For details on how to fix these errors, please see the following pages:
        - https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/headings
      """

  Scenario: Two failing checks from different standards
    Given a website running at http://localhost:54321
    When I run `bbc-a11y http://localhost:54321/heading_and_title_attribute_failures.html`
    Then it should fail with:
      """
      ✗ http://localhost:54321/heading_and_title_attribute_failures.html
        * Structure: Headings: Exactly one main heading
          - Found 0 h1 elements.
        * Text equivalents: Tooltips and supplementary information: Title attributes only on inputs
          - Non-input element has title attribute: /html/body/p/span

      For details on how to fix these errors, please see the following pages:
        - https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/headings
        - https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/tooltips-and-supplementary-information
      """

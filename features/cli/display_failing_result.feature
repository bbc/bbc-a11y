Feature: Display failing result

  Scenario: One standard fails
    Given a website running on a11ytests.com
    When I run `bbc-a11y https://a11ytests.com/missing_main_heading`
    Then it should fail with:
      """
      ✗ https://a11ytests.com/missing_main_heading
        * Structure: Headings: Exactly one main heading
          - Found 0 h1 elements.

      For details on how to fix these errors, please see the following pages:
        - https://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/structure/headings
      """

  Scenario: One standard generates a warning
    Given a website running on a11ytests.com
    When I run `bbc-a11y https://a11ytests.com/subheading_first`
    Then it should fail with:
      """
      ✓ https://a11ytests.com/subheading_first
        ⚠ Structure: Headings: Headings must be in ascending order
          - First heading was not a main heading: /html/body/h3

      For details on how to fix these errors, please see the following pages:
        - https://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/structure/headings
      """

  Scenario: Failures and warnings from the same standard
    Given a website running on a11ytests.com
    When I run `bbc-a11y https://a11ytests.com/two_headings_failures_and_one_warning`
    Then it should fail with:
      """
      ✗ https://a11ytests.com/two_headings_failures_and_one_warning
        ⚠ Structure: Headings: Headings must be in ascending order
          - First heading was not a main heading: /html/body/h2
        * Structure: Headings: Exactly one main heading
          - Found 0 h1 elements.
        * Structure: Headings: Content must follow headings
          - No content follows: /html/body/h2

      For details on how to fix these errors, please see the following pages:
        - https://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/structure/headings
      """

  Scenario: Two failing checks from different standards
    Given a website running on a11ytests.com
    When I run `bbc-a11y https://a11ytests.com/heading_and_title_attribute_failures`
    Then it should fail with:
      """
      ✗ https://a11ytests.com/heading_and_title_attribute_failures
        * Structure: Headings: Exactly one main heading
          - Found 0 h1 elements.
        * Text equivalents: Tooltips and supplementary information: Title attributes only on inputs
          - Non-input element has title attribute: /html/body/p/span

      For details on how to fix these errors, please see the following pages:
        - https://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/structure/headings
        - https://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/text-equivalents/tooltips-and-supplementary-information
      """

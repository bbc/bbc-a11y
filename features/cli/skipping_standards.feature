Feature: Skipping Standards

  Scenario: One standard is skipped
    Given a website running at http://localhost:54321
    And a file named "a11y.rb" with:
      """
      page "http://localhost:54321/missing_header.html" do
        skip_standard "Headings: exactly one main heading"
      end
      """
    When I run `a11y`
    Then it should pass with:
      """
      ✓ http://localhost:54321/missing_header.html
      """

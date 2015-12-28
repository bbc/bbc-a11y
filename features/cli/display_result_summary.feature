Feature: Display result summary

  Scenario: Summarises pages checked and standard results
    Given a website running at http://localhost:54321
    And a file named "a11y.rb" with:
      """
      page "http://localhost:54321/perfect.html"
      page "http://localhost:54321/missing_header.html"
      page "http://localhost:54321/missing_header.html?again!" do
        skip_standard /ExactlyOneMainHeading/
      end
      """
    When I run `a11y`
    Then it should fail with:
      """
      3 pages checked, 1 error found, 1 standard skipped
      """

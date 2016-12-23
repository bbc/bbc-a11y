Feature: Display result summary

  @config
  Scenario: Summarises pages checked and standard results
    Given a website running at http://localhost:54321
    And a file named ".a11y" with:
      """
      page http://localhost:54321/perfect.html
      page http://localhost:54321/missing_header.html
      page http://localhost:54321/missing_header.html?again!
      skip Headings: exactly one main heading
      """
    When I run `a11y`
    Then it should fail with:
      """
      3 pages checked, 1 error found, 1 standard skipped
      """

  Scenario: Reminds users to consider usability beyond lint results
    Given a website running at http://localhost:54321
    When I run `a11y http://localhost:54321/perfect.html`
    Then it should pass with:
      """
      No errors found. But please remember:

      "Testing shows the presence, not the absence of bugs" -- Edsger W. Dijkstra

      I am only a robot. Always make time to perform manual testing using assistive
      technologies like VoiceOver, JAWS and NVDA to make sure you're providing a good
      user experience.
      """

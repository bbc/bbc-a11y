Feature: Display result summary

  Scenario: Summarises pages checked and standard results
    Given a website running on a11ytests.com
    And a file named "a11y.js" with:
      """
      page("https://a11ytests.com/perfect")
      page("https://a11ytests.com/missing_main_heading", {
        skip: "Structure: Headings: Exactly one main heading"
      })
      page("https://a11ytests.com/missing_main_heading?again!")
      page("https://a11ytests.com/subheading_first")
      """
    When I run `bbc-a11y`
    Then it should fail with:
      """
      4 pages checked, 1 error found, 1 warning, 1 standard skipped
      """

  Scenario: Reminds users to consider usability beyond lint results
    Given a website running on a11ytests.com
    When I run `bbc-a11y https://a11ytests.com/perfect`
    Then it should pass with:
      """
      No errors found. But please remember:

      "Testing shows the presence, not the absence of bugs" -- Edsger W. Dijkstra

      I am only a robot. Always make time to perform manual testing using assistive
      technologies like VoiceOver, JAWS and NVDA to make sure you're providing a good
      user experience.
      """

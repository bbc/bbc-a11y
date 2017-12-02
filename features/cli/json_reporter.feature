Feature: JSON Reporter
  Scenario: Reporting results in generic JSON format
    Given a website running at http://localhost:54321
    And a file named "a11y.js" with:
      """
      page("http://localhost:54321/perfect.html", {
        skip: ["Structure: Containers and landmarks: Exactly one main landmark"]
      })
      page("http://localhost:54321/missing_main_heading.html")
      """
    When I run `bbc-a11y --reporter json`
    Then it should fail with:
      """
      {
        "pagesChecked": 2,
        "errorsFound": 1,
        "errorsHidden": 0,
        "standardsSkipped": 1,
        "pages": [
          {
            "url": "http://localhost:54321/perfect.html",
            "result": {
      """

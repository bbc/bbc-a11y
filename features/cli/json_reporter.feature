Feature: JSON Reporter
  Scenario: Reporting results in generic JSON format
    Given a website running on a11ytests.com
    And a file named "a11y.js" with:
      """
      page("https://a11ytests.com/perfect", {
        skip: ["Structure: Containers and landmarks: Exactly one main landmark"]
      })
      page("https://a11ytests.com/missing_main_heading")
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
            "url": "https://a11ytests.com/perfect",
            "result": {
      """

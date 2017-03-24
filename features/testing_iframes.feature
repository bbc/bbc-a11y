Feature: Testing iframes

  Scenario: Missing heading in an iframe
    Given a website running at http://localhost:54321
    And a page with the body:
      """
      <h1>This frame has no main heading:</h1>
      <iframe src="http://localhost:54321/missing_main_heading.html"></iframe>
      """
    When I test the "Headings: Exactly one main heading" standard
    Then it fails with the message:
      """
      In frame /html/body/iframe : Found 0 h1 elements.
      """

  Scenario: Missing heading in nested iframe
    Given a website running at http://localhost:54321
    And a page with the body:
      """
      <h1>This frame has no main heading:</h1>
      <iframe src="http://localhost:54321/iframe.html"></iframe>
      """
    When I test the "Headings: Exactly one main heading" standard
    Then it fails with the message:
      """
      In frame /html/body/iframe : Found 0 h1 elements.
      In frame /html/body/iframe /html/body/iframe : Found 0 h1 elements.
      """

  Scenario: Cross-domain iframes
    Given a website running at http://localhost:54321
    And a page with the body:
      """
      <h1>This frame has no main heading:</h1>
      <iframe src="http://127.0.0.1:54321/iframe.html"></iframe>
      """
    When I test the "Headings: Exactly one main heading" standard
    Then it fails with the message:
      """
      In frame /html/body/iframe : Found 0 h1 elements.
      In frame /html/body/iframe /html/body/iframe : Found 0 h1 elements.
      """

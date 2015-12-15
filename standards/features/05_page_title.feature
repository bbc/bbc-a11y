Feature: Page title

  @manual
  Scenario: Check the title

    We can't easily test for the uniqueness of the title, but we can test for the presence of the element
    and ensure it has content.

    In terms of prompting for manual tests, could we compare the title element with the content of the first
    `<h1>` element on the page, and if the former contains the latter then automatically pass the test.

    For example:

        <title>BBC Weather - Weather in London</title>

        ~

        <h1>Weather in London</h1>

    ...would pass automatically, but a `<title>` element that does not contain the string 'Weather in London'
    would be flagged for manual review.

    When I visit the page
    Then the document should have a title
    And the title should describe the primary content of the document

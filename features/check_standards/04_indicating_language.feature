Feature: Specify content language

  The main language of the page **must** be specified.

  Changes to language within the page **must** be indicated.

  Rationale
  =========

  Assistive technologies such as screen readers have support for different
  languages, allowing for appropriate pronunciation.

  Scenario: lang attribute on html element
    Given a page with the HTML:
      """
      <!DOCTYPE html>
      <html lang="en-GB">
        <head>
          <title>Language specified</title>
        </head>
        <body>
          <h1>The language is specified</h1>
        </body>
      </html>
      """
    When I test the "Indicating language: Html must have lang attribute" standard
    Then it passes

  Scenario: Missing lang attribute on html element
    Given a page with the HTML:
      """
      <!DOCTYPE html>
      <html>
        <head>
          <title>Language missing</title>
        </head>
        <body>
          <h1>The language is missing</h1>
        </body>
      </html>
      """
    When I test the "Indicating language: Html must have lang attribute" standard
    Then it fails with the message:
      """
      html tag has no lang attribute: /html
      """

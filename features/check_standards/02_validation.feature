Feature: Validation

  All documents must have a W3C recommended Doctype and all Markup must
  validate against that Doctype.

  Rationale
  =========

  While assistive technologies such as screen readers generally do a good job of
  interpreting invalid HTML there will be less risk of problems arising if the
  document follows a recognised standard Doctype.

  @internet
  Scenario: Valid for doctype
    Given a page with the HTML:
      """
      <!DOCTYPE html>
      <html lang="en-GB">
        <head>
          <title>Page title</title>
          <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        </head>
        <body>
          <h1>And a heading</h1>
        </body>
      </html>
      """
    And my page configuration is:
      """
      {
        w3cValidator: 'https://validator.w3.org/nu/'
      }
      """
    When I test the "Validation: Markup must validate against doctype" standard
    Then it passes

  @internet
  Scenario: Invalid for doctype
    Given a page with the HTML:
      """
      <!DOCTYPE html>
      <html lang="en-GB">
        <head>
          <title>Page title</title>
        </head>
        <body>
          <h1>And a heading</h1>
        </body>
      </html>
      """
    When my page configuration is:
      """
      {
        w3cValidator: 'https://validator.w3.org/nu/'
      }
      """
    And I test the "Validation: Markup must validate against doctype" standard
    Then it fails with the message:
      """
      The character encoding was not declared. Proceeding using “windows-1252”.
      """

  Scenario: No doctype specified
    Given a page with the HTML:
      """
      <html lang="en-GB">
        <head>
          <title>No doctype specified</title>
        </head>
        <body>
          <h1>The doctype is not specified</h1>
        </body>
      </html>
      """
    When I test the "Validation: All documents must have a W3C recommended doctype" standard
    Then it fails with the message:
      """
      Missing w3c recommended doctype
      """

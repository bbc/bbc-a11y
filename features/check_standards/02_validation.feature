Feature: Validation

  All documents must have a W3C recommended Doctype and all Markup must
  validate against that Doctype.

  Rationale
  =========

  While assistive technologies such as screen readers generally do a good job of
  interpreting invalid HTML there will be less risk of problems arising if the
  document follows a recognised standard Doctype.

  Scenario: Valid for doctype

  Scenario: Invalid for doctype

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

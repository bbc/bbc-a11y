Feature: Indicating language

  The language of a page or app must be specified, and changes in language must
  be indicated.

  When listening, correct pronunciation helps understanding. For users of
  assistive technologies such as screen readers it is particularly important, as
  some have different speech synthesizers for different languages. For example,
  "chat" means something different when using English pronunciation rather than
  French.

  The default language for the content of a page or app must be defined in the
  code for the correct speech synthesizer to be used. It will over-ride any
  language and dialect setting specified on the users device.

  For multi-lingual content, the language for anything that varies from the
  default language must also be defined in the local code for the correct speech
  synthesizer to be used. This includes image alternatives, form labels, quotes,
  objects, media alternatives, and other elements. It will over-ride the
  specified default language and any language and dialect setting specified on
  the users device.

  HTML Applicability
  ==================

  The main language of the page **must** be specified.

  Changes to language within the page **must** be indicated.

  Assistive technologies such as screen readers have support for different
  languages, allowing for appropriate pronunciation.

  @html @automated
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
    When I test the "Editorial: Indicating language: Html must have lang attribute" standard
    Then it passes

  @html @automated
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
    When I test the "Editorial: Indicating language: Html must have lang attribute" standard
    Then it fails with the message:
      """
      html tag has no lang attribute: /html
      """

  @html @manual
  Scenario: Changing language with indication (manual pass)
    Given I am performing a manual test of the "Editorial: Indicating language: Changes to language must be indicated" standard
    And I have been asked "Are any changes to the defined language of the page indicated programmatically?"
    When I answer "Yes (or not applicable)"
    Then the manual test passes

  @html @manual
  Scenario: Changing language with indication (manual fail)
    Given I am performing a manual test of the "Editorial: Indicating language: Changes to language must be indicated" standard
    And I have been asked "Are any changes to the defined language of the page indicated programmatically?"
    When I answer "No"
    Then the manual test fails

Feature: Page Titles

  Documents must have a page <title> that identifies its main content.

  Rationale
  =========

  Document titles help users orientate themselves within web sites and apps.
  The document <title> element content is often the first thing a speech output
  user will hear and acts as a confirmation of what page they have arrived at.
  Document titles commonly have the same content as the main <h1> element.

  Scenario: Valid page title with string
    Given a page with the HTML:
      """
      <!DOCTYPE html>
      <html lang="en-GB">
        <head>
          <title>Chocolate brownies - Yummy recipe site</title>
        </head>
        <body>
          <h1>Chocolate brownies</h1>
        </body>
      </html>
      """
    When my page configuration is:
      """
      {
        title: 'Chocolate brownies - Yummy recipe site'
      }
      """
    When I test the "Page titles: Title element must identify main content" standard
    Then it passes

  Scenario: Valid page title with template string
    Given a page with the HTML:
      """
      <!DOCTYPE html>
      <html lang="en-GB">
        <head>
          <title>Chocolate brownies - Yummy recipe site</title>
        </head>
        <body>
          <h1>Chocolate brownies</h1>
        </body>
      </html>
      """
    When my page configuration is:
      """
      {
        title: '{h1:first} - Yummy recipe site'
      }
      """
    When I test the "Page titles: Title element must identify main content" standard
    Then it passes

  Scenario: Valid page title with template function
    Given a page with the HTML:
      """
      <!DOCTYPE html>
      <html lang="en-GB">
        <head>
          <title>Chocolate brownies - Yummy recipe site</title>
        </head>
        <body>
          <h1>Chocolate brownies</h1>
        </body>
      </html>
      """
    When my page configuration is:
      """
      {
        title: $ => $('h1').text() + ' - Yummy recipe site'
      }
      """
    When I test the "Page titles: Title element must identify main content" standard
    Then it passes

  Scenario: Valid page title with invalid template
    Given a page with the HTML:
      """
      <!DOCTYPE html>
      <html lang="en-GB">
        <head>
          <title>Chocolate brownies - Yummy recipe site</title>
        </head>
        <body>
          <h1>Chocolate brownies</h1>
        </body>
      </html>
      """
    When my page configuration is:
      """
      {
        title: 666
      }
      """
    When I test the "Page titles: Title element must identify main content" standard
    Then it fails with the message:
      """
      Invalid title 666
      """

  Scenario: Invalid page title
    Given a page with the HTML:
      """
      <!DOCTYPE html>
      <html lang="en-GB">
        <head>
          <title>Oops wrong title - Yummy recipe site</title>
        </head>
        <body>
          <h1>Sausage rolls</h1>
        </body>
      </html>
      """
    When my page configuration is:
      """
      {
        title: $ => $('h1').text() + ' - Yummy recipe site'
      }
      """
    When I test the "Page titles: Title element must identify main content" standard
    Then it fails with the message:
      """
      Title element failed to identify main content: expected "Sausage rolls - Yummy recipe site", actual "Oops wrong title - Yummy recipe site"
      """

Feature: Unique page/screen titles

  All pages or screens must be uniquely and clearly identifiable.

  The page/screen title is often the first thing people will see or hear and
  acts as a confirmation of where they have arrived at, helping people orientate
  themselves within websites and apps. It is particularly helpful for vision
  impaired users who cannot perceive the whole page/screen at once.

  Page titles are standard for HTML. Apps have the facility to add screen
  titles. However, when visible space is in short supply other means may be used
  to identify location, such as a logo on a homepage, the first item of content
  presented as a heading, or a selected tab on top navigation.

  HTML Applicability
  ==================

  Documents must have a page <title> that identifies its main content.

  Document titles help users orientate themselves within web sites and apps.
  The document <title> element content is often the first thing a speech output
  user will hear and acts as a confirmation of what page they have arrived at.
  Document titles commonly have the same content as the main <h1> element.

  @html @automated @configured
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
    When I test the "Structure: Unique page/screen titles: Title element must identify main content" standard
    Then it passes

  @html @automated @configured
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
    When I test the "Structure: Unique page/screen titles: Title element must identify main content" standard
    Then it passes

  @html @automated @configured
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
    When I test the "Structure: Unique page/screen titles: Title element must identify main content" standard
    Then it passes

  @html @automated @configured
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
    When I test the "Structure: Unique page/screen titles: Title element must identify main content" standard
    Then it fails with the message:
      """
      Invalid title 666
      """

  @html @automated @configured
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
    When I test the "Structure: Unique page/screen titles: Title element must identify main content" standard
    Then it fails with the message:
      """
      Title element failed to identify main content: expected "Sausage rolls - Yummy recipe site", actual "Oops wrong title - Yummy recipe site"
      """

  @html @manual
  Scenario: Title uniquely and clearly identifiable (manual pass)
    Given I am performing a manual test of the "Structure: Unique page/screen titles: Page titles must be uniquely and clearly identifiable" standard
    And I have been asked "Is the page title uniquely and clearly identifiable?"
    When I answer "Yes"
    Then the manual test passes

  @html @manual
  Scenario: Title not uniquely and clearly identifiable (manual fail)
    Given I am performing a manual test of the "Structure: Unique page/screen titles: Page titles must be uniquely and clearly identifiable" standard
    And I have been asked "Is the page title uniquely and clearly identifiable?"
    When I answer "No"
    Then the manual test fails

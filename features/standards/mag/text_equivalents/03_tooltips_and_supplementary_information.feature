Feature: Tooltips and supplementary information

  Tooltips must not repeat link text or other alternatives.

  Not all users will see tooltips so they must not include essential
  information.

  Hints, titles and other tooltip-like text should provide additional
  explanatory content rather than repeat the main alternative for an element,
  object, or image. This prevents duplication of information for screen reader
  users.

  HTML Applicability
  ==================

  `title` attributes **must not** be used for critical information and **must
  not** repeat content that is already visible and associated with the same
  control or content.

  `title` attributes are inaccessible to keyboard users without additional
  Assistive Technology. They are dependent on user settings in Screen Readers
  and similar Assistive Technology.

  Additionally they suffer from discoverability problems: pointing device users
  are required to hover over page elements and pause before the title tooltip
  displays, usually with no indication that there is additional content to be
  displayed.

  Repeating content in visible text and `title` attributes can lead to content
  clutter and repeated phrases.

  Key recommendations are:

  - Do not use the `title` attribute unless on a form input as title text is not
    well supported on links on mobile
  - Do not use `title` attributes and explicit labels together on form fields

  @html @automated
  Scenario: Form field with title attribute
    Given a page with the body:
      """
      <button type="button" title="Close Button">
        <img src="close.png" />
      </button>
      """
    When I test the "Text equivalents: Tooltips and supplementary information: Title attributes only on inputs" standard
    Then it passes

  @html @automated
  Scenario: Hidden element with title attribute
    Given a page with the body:
      """
      <iframe style="display:none" title="Ignore me, I'm invisible"></iframe>
      """
    When I test the "Text equivalents: Tooltips and supplementary information: Title attributes only on inputs" standard
    Then it passes

  @html @automated
  Scenario: Anchor tag with title attribute
    Given a page with the body:
      """
      <a href="close" title="Close Button">
        <img src="close.png" />
      </a>
      """
    When I test the "Text equivalents: Tooltips and supplementary information: Title attributes only on inputs" standard
    Then it fails with the message:
      """
      Non-input element has title attribute: /html/body/a
      """

  @html @automated
  Scenario: Iframe tag with title attribute
    Given a page with the body:
      """
      <iframe src="https://a11ytests.com/perfect" title="Rainbows and unicorns"></iframe>
      """
    When I test the "Text equivalents: Tooltips and supplementary information: Title attributes only on inputs" standard
    Then it passes

  @html @automated
  Scenario: Title attribute duplicates content
    Given a page with the body:
      """
      <a href="back" title="Back to Home">
        <img src="back.png" /> Back to Home
      </a>
      """
    When I test the "Text equivalents: Tooltips and supplementary information: Title attributes must not duplicate content" standard
    Then it fails with the message:
      """
      Title attribute duplicates content: /html/body/a
      """

  @html @automated
  Scenario: Title attribute duplicates nested content
    Given a page with the body:
      """
      <a href="back" title="Back to Home">
        <span>Back to <b>Home</b></span>
      </a>
      """
    When I test the "Text equivalents: Tooltips and supplementary information: Title attributes must not duplicate content" standard
    Then it fails with the message:
      """
      Title attribute duplicates content: /html/body/a
      """

  @html @manual
  Scenario: Tooltips do not repeat link text or other alternatives (manual pass)
    Given I am performing a manual test of the "Text equivalents: Tooltips and supplementary information: Tooltips must not repeat link text or other alternatives" standard
    And I have been asked "Do tooltips repeat link text or other alternatives?"
    When I answer "No (or not applicable)"
    Then the manual test passes

  @html @manual
  Scenario: Tooltips repeat link text or other alternatives (manual fail)
    Given I am performing a manual test of the "Text equivalents: Tooltips and supplementary information: Tooltips must not repeat link text or other alternatives" standard
    And I have been asked "Do tooltips repeat link text or other alternatives?"
    When I answer "Yes"
    Then the manual test fails

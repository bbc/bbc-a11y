Feature: Correctly use `title` attributes

  `title` attributes **must not** be used for critical information and **must not** repeat content that is already visible and associated with the same control or content.

  Rationale
  =========

  `title` attributes are inaccessible to keyboard users without additional Assistive Technology. They are dependent on user settings in Screen Readers and similar Assistive Technology.

  Additionally they suffer from discoverability problems: pointing device users are required to hover over page elements and pause before the title tooltip displays, usually with no indication that there is additional content to be displayed.

  Repeating content in visible text and `title` attributes can lead to content clutter and repeated phrases.

  Key recommendations are:

  - Do not use the `title` attribute unless on a form input as title text is not well supported on links on mobile
  - Do not use `title` attributes and explicit labels together on form fields

  Scenario: Form field with title attribute
    Given a page with the HTML:
      """
      <button type="button" title="Close Button">
        <img src="close.png" />
      </button>
      """
    When I validate the "title attributes only on inputs" standard
    Then it passes

  Scenario: Anchor tag with title attribute
    Given a page with the HTML:
      """
      <a href="close" title="Close Button">
        <img src="close.png" />
      </a>
      """
    When I validate the "title attributes only on inputs" standard
    Then it fails with the message:
      """
      Non-input element has title attribute: /html/body/a
      """

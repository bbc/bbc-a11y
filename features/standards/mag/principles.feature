Feature: Principles

  These three principles embody an approach to the design and development of
  inclusive and usable applications and websites for all.

  Use platform and web standards as intended
  ==========================================

  Always use web and platform specific standards as intended. When standards and
  guidelines are implemented using non-standard techniques there is a risk that
  users who are dependant on platform specific accessibility features such as
  accessibility settings and screen readers will be excluded from accessing the
  content.

  Platform specific guidelines include the iOS Accessibility Guidelines, the
  Android User Interface Guidelines and the Designing for Accessibility portion
  of the Android guidelines. For the web there are the Web Content Accessibility
  Guidelines as well as the Mobile Accessibility resources from W3C.

  Use standard user interface controls where possible
  ===================================================
  Standard UI controls, objects, and elements should be used to ensure a greater
  level of accessibility. Custom controls tend to not implement accessibility as
  fully as standard platform controls. For example in iOS standard controls will
  have traits assigned that are understood by VoiceOver and therefore users.

  Support platform accessibility
  ==============================
  All content and functionality must work alongside, and not suppress, native
  accessibility and features and settings.

  Navigation methods
  ------------------

  All content must be accessible and navigable using the platforms navigation
  paradigm for assistive technology.

  For example, the directional controller must be supported on Android to allow
  users of the TalkBack screen reader to review and navigate page content.
  Android requires that all elements be keyboard accessible so they can be
  accessed with a d-pad or track ball. Android 4.0 has lessened this requirement
  a bit by including an "Explore by Touch" method.

  On iOS it is possible to hook items into the Accessibility API by ensuring all
  meaningful items have ‘accessibility enabled’ which in turn makes them
  focusable.

  Support platform assistive technologies or features
  ---------------------------------------------------

  When applications or sites block, disable, or interfere with platform specific
  accessibility features or technology, users with disabilities may not be able
  to use the site or app. Potential issues include suppressing zoom on websites
  or disabling the ability to highlight and copy text in HTML and therefore
  ‘Speak Text’ features.

  Some users with disabilities may require multiple accessibility features
  because they have multiple disabilities. For example, a user may be deaf and
  blind or may have low vision and unable to use a pointing device or touch
  screen. Multiple modes of operation should be supported allowing users to
  access content according to their preferences.

  On Android and iOS for example, built-in keyboard support should not prevent
  other standard touch events. iOS accessibility features and the API are
  designed to make accessibility information and input methods available to
  multiple disability types however some optimisation such as the deliberate
  misspelling of an accessibility label or hint to ensure correct pronunciation
  can make the content inaccessible to other disability types - for example,
  users of Braille who are deaf blind.

  HTML Applicability
  ==================

  All documents must have a W3C recommended Doctype and all Markup must
  validate against that Doctype.

  While assistive technologies such as screen readers generally do a good job of
  interpreting invalid HTML there will be less risk of problems arising if the
  document follows a recognised standard Doctype.

  `<a>` elements used for controls **must** have an `href` attribute.

  In general, use `<a>` elements when there is a URL associated with the
  interaction when JavaScript is not enabled, and `<button>` elements for
  interactions that don't have an associated URL.

  `<a>` elements without a `href` attribute are not keyboard accessible, and
  therefore must not be used for controls.

  @html @automated @configured @requires-internet-connection
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
    When I test the "Principles: Markup must validate against doctype" standard
    Then it passes

  @html @automated @configured @requires-internet-connection
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
    And I test the "Principles: Markup must validate against doctype" standard
    Then it fails with the message:
      """
      The character encoding was not declared. Proceeding using “windows-1252”.
      """

  @html @automated
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
    When I test the "Principles: All documents must have a W3C recommended doctype" standard
    Then it fails with the message:
      """
      Missing w3c recommended doctype
      """

  @html @automated
  Scenario: All anchor tags have href attributes
    Given a page with the body:
      """
      <button type="button">Open panel</button>
      <ul>
          <li><a href="/news">News</a></li>
          <li><a href="#sporttab">Sport</a></li>
          <li><a href="#entertainmenttab">Entertainment</a></li>
      </ul>
      """
    When I test the "Principles: Anchors must have hrefs" standard
    Then it passes

  @html @automated
  Scenario: Some anchor tags do not have href attributes
    Given a page with the body:
      """
      <ul>
          <li><a>News</a></li>
          <li><a href="#sport">Sport</a></li>
          <li><a>Entertainment</a></li>
      </ul>
      """
    When I test the "Principles: Anchors must have hrefs" standard
    Then it fails with the message:
      """
      Anchor has no href attribute: /html/body/ul/li[1]/a
      Anchor has no href attribute: /html/body/ul/li[3]/a
      """

  @html @automated
  Scenario: Hidden anchor tag with no href attribute
    Given a page with the body:
      """
      <a style="display:none">I'm invisible, ignore me</a>
      """
    When I test the "Principles: Anchors must have hrefs" standard
    Then it passes

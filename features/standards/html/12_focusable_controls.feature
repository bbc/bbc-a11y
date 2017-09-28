Feature: Focusable controls

  Controls for JavaScript enhanced interactions **must** be `<a>`, `<button>`,
  or `<input>` elements if that is the only mechanism for controlling them.

  `<a>` elements used for controls **must** have an `href` attribute.

  Controls that have no purpose without JavaScript **must not** be added to the
  page before the associated code is available capable of running.

  Rationale
  =========

  When creating controls for user interaction with JavaScript enhanced features,
  for example a carousel with previous and next controls, the controls must be
  implemented with elements that provide natively focusable elements with click,
  keydown, and focus events so they are accessible to keyboard as well as
  pointing device users. If there is an alternative method of controlling the
  feature, for example a carousel that automatically displays new content when
  it receives content then controls that are only available to pointing device
  users can be used.

  In general, use `<a>` elements when there is a URL associated with the
  interaction when JavaScript is not enabled, and `<button>` elements for
  interactions that don't have an associated URL.

  `<a>` elements without a `href` attribute are not keyboard accessible, and
  therefore must not be used for controls.

  When there is no core (non-JavaScript) interaction then the control must not
  be added to the document before the associated JavaScript is capable of
  running as this would lead to controls that apparently do nothing, potentially
  causing confusion to users.

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
    When I test the "Focusable controls: Anchors must have hrefs" standard
    Then it passes

  Scenario: Some anchor tags do not have href attributes
    Given a page with the body:
      """
      <ul>
          <li><a>News</a></li>
          <li><a href="#sport">Sport</a></li>
          <li><a>Entertainment</a></li>
      </ul>
      """
    When I test the "Focusable controls: Anchors must have hrefs" standard
    Then it fails with the message:
      """
      Anchor has no href attribute: /html/body/ul/li[1]/a
      Anchor has no href attribute: /html/body/ul/li[3]/a
      """

  Scenario: Hidden anchor tag with no href attribute
    Given a page with the body:
      """
      <a style="display:none">I'm invisible, ignore me</a>
      """
    When I test the "Focusable controls: Anchors must have hrefs" standard
    Then it passes

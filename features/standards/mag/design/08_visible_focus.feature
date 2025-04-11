Feature: Visible focus

  When focused, all actionable and focusable elements must have a visible state
  change.

  Visible focus helps all users track where they are within the content. Sighted
  keyboard and switch device users track progress as they navigate focusable
  elements, similar to using a remote control with a TV interface. Touch users
  also receive confirmation that an element is interactive.

  Visible focus states happen when hover, focus or touch interactions occur. Do
  not depend on a browser's default visible states for hover, focus, or touch,
  as they may not work with the design. Do not inadvertently remove any default
  visible states for hover, focus, or touch unless providing an alternative. The
  visible focus state for all three interactions may look the same.

  Hover, focus and touch states should not be used to convey information that is
  not available elsewhere.

  HTML Applicability
  ==================

  Hidden elements in tab order must be made visible on focus.

  While it sometimes beneficial to provide content to screen reader users only,
  not all keyboard users also use a screen reader. Having hidden content in tab
  order, such as <a> or <button> elements, that remain hidden when focussed
  causes confusion for keyboard users that do not also use a screen reader.

  It is recommened to use a clipping technique instead of negative positioning
  because of problems this can cause in iOS7 Safari, but either approach is
  accessible.

  Text links must have a mouse-over state change.

  When hovered over links should have a change in style as confirmation that
  they are links.

  Appropriate styles are:

  * adding an underline to previously not underlined content
  * a change in colour, with a sufficiently different contrast to meet the
    contrast standard compared with the default state colour

  All focusable elements must have a clearly identifiable visual style when
  they have focus.

  Sighted keyboard users do not have the explicit association between pointer
  and content that pointing device users have, so it is important that they are
  aware at all times what element currently has focus and which element keyboard
  interactions will operate on.

  The currently focussed element should therefore have a visual style that makes
  it clearly distinguishable from the surrounding content.

  @html @automated
  Scenario: Element hidden using absolute top positioning
    Given a page with the body:
      """
      <style>
      .hidden {
        position: absolute;
        top: -999em;
      }
      </style>

      <div class="hidden">
        <a href="https://www.bbc.co.uk/">BBC</a>
      </div>
      """
    When I test the "Design: Visible focus: Elements must be visible on focus" standard
    Then it fails with the message:
      """
      Element is invisible on focus: /html/body/div/a
      """

  @html @automated
  Scenario: Element hidden using absolute left positioning
    Given a page with the body:
      """
      <style>
      .hidden {
        position: absolute;
        left: -999em;
      }
      </style>

      <div class="hidden">
        <a href="https://www.bbc.co.uk/">BBC</a>
      </div>
      """
    When I test the "Design: Visible focus: Elements must be visible on focus" standard
    Then it fails with the message:
      """
      Element is invisible on focus: /html/body/div/a
      """

  @html @automated
  Scenario: Element is visible
    Given a page with the body:
      """
      <a href="https://www.bbc.co.uk/">BBC</a>
      """
    When I test the "Design: Visible focus: Elements must be visible on focus" standard
    Then it passes

  @html @manual
  Scenario: Manual pass
    Given I am performing a manual test of the "Design: Visible focus: Focused elements must visibly change state" standard
    And I have been asked "Do all actionable and focusable elements visibly change state when focused?"
    When I answer "Yes"
    Then the manual test passes

  @html @manual
  Scenario: Manual fail
    Given I am performing a manual test of the "Design: Visible focus: Focused elements must visibly change state" standard
    And I have been asked "Do all actionable and focusable elements visibly change state when focused?"
    When I answer "No"
    Then the manual test fails

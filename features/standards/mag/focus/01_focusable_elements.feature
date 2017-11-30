Feature: Focusable elements

  All interactive elements must be focusable and non-interactive elements must
  not be focusable.

  Some people may only use a keyboard, switch device or voice control for
  navigation and input. For example, astronauts in space struggle to use a
  mouse, track pad, or touch screen because these require gravity.

  In order to operate an interactive element, a user must first be able to move
  focus to the element via any input device (keyboard, mouse, touch, voice,
  switch device etc.).

  Focus is defined differently depending on the platform. For example, iOS
  focus is limited to elements that support keyboard input and VoiceOver focus
  also requires accessibility to be enabled and proper frames defined.

  HTML Applicability
  ==================

  `tabindex` values of `0` **must not** be used on elements that are not
  focusable by default.

  Using `tabindex="0"` on an element adds it to the document tab order, however
  it does not change the element type to allow it to be discovered by navigating
  by link or form element, nor does it bind click and key press handlers to the
  element. There are no circumstances in which it is not better to use a
  natively focusable control such as a `<a>` or `<button>`.

  Controls for JavaScript enhanced interactions **must** be `<a>`, `<button>`,
  or `<input>` elements if that is the only mechanism for controlling them.

  When creating controls for user interaction with JavaScript enhanced features,
  for example a carousel with previous and next controls, the controls must be
  implemented with elements that provide natively focusable elements with click,
  keydown, and focus events so they are accessible to keyboard as well as
  pointing device users. If there is an alternative method of controlling the
  feature, for example a carousel that automatically displays new content when
  it receives content then controls that are only available to pointing device
  users can be used.

  @html @automated
  Scenario: Element with negative Tab index
    Given a page with the body:
      """
      <a href="/news">News</a>
      <button type="submit">Search</button>
      <div tabindex="-1"></div>
      """
    When I test the "Focus: Focusable elements: Zero Tab index must only be set on elements which are focusable by default" standard
    Then it passes

  @html @automated
  Scenario: Focusable elements with zero Tab index
    Given a page with the body:
      """
      <a href="/news" tabindex="0">News</a>
      <button tabindex="0">Search</button>
      <input type="submit" tabindex="0" value="Submit" />
      <select tabindex="0"></select>
      <textarea tabindex="0"></textarea>
      """
    When I test the "Focus: Focusable elements: Zero Tab index must only be set on elements which are focusable by default" standard
    Then it passes

  @html @automated
  Scenario: Unfocusable element with zero Tab index
    Given a page with the body:
      """
      <a href="/news" tabindex="1">News</a>
      <button type="submit" tabindex="2">Search</button>
      <div tabindex="3"></div>
      <div tabindex="0"></div>
      """
    When I test the "Focus: Focusable elements: Zero Tab index must only be set on elements which are focusable by default" standard
    Then it fails with the message:
      """
      Non-focusable element with tabindex=0: /html/body/div[2]
      """

  @html @automated
  Scenario: Unfocusable element with zero Tab index
    Given a page with the body:
      """
      <a href="/news" tabindex="1">News</a>
      <button type="submit" tabindex="2">Search</button>
      <div tabindex="3"></div>
      <div tabindex="0" style="display:none"></div>
      """
    When I test the "Focus: Focusable elements: Zero Tab index must only be set on elements which are focusable by default" standard
    Then it passes

  @html @manual
  Scenario: Interactive elements are focusable (manual pass)
    Given I am performing a manual test of the "Focus: Focusable elements: Interactive elements must be focusable" standard
    And I have been asked "Are all interactive elements focusable?"
    When I answer "Yes"
    Then the manual test passes

  @html @manual
  Scenario: Not all interactive elements are focusable (manual fail)
    Given I am performing a manual test of the "Focus: Focusable elements: Interactive elements must be focusable" standard
    And I have been asked "Are all interactive elements focusable?"
    When I answer "No"
    Then the manual test fails

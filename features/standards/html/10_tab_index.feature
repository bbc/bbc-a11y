Feature: Tab index

  Positive `tabindex` attribute values **must not** be used to create a logical
  tab order.

  `tabindex` values of `0` **must not** be used on elements that are not
  focusable by default.

  Rationale
  =========

  Typical BBC pages are made up of several shared components (Global navigation,
  page content, share tools, location service widgets, etc.) so no one piece of
  code has complete awareness of the content of the page or when the content
  updates. Positive `tabindex` values results in unpredictable tab order that do
  not occur if the natural order of content is relied upon.

  Using `tabindex="0"` on an element adds it to the document tab order, however
  it does not change the element type to allow it to be discovered by navigating
  by link or form element, nor does it bind click and key press handlers to the
  element. There are no circumstances in which it is not better to use a
  natively focusable control such as a `<a>` or `<button>`.

  Scenario: Element with negative Tab index
    Given a page with the body:
      """
      <a href="/news">News</a>
      <button type="submit">Search</button>
      <div tabindex="-1"></div>
      """
    When I test the "Tab index: Zero Tab index must only be set on elements which are focusable by default" standard
    Then it passes

  Scenario: Focusable elements with zero Tab index
    Given a page with the body:
      """
      <a href="/news" tabindex="0">News</a>
      <button tabindex="0">Search</button>
      <input type="submit" tabindex="0" value="Submit" />
      <select tabindex="0"></select>
      <textarea tabindex="0"></textarea>
      """
    When I test the "Tab index: Zero Tab index must only be set on elements which are focusable by default" standard
    Then it passes

  Scenario: Unfocusable element with zero Tab index
    Given a page with the body:
      """
      <a href="/news" tabindex="1">News</a>
      <button type="submit" tabindex="2">Search</button>
      <div tabindex="3"></div>
      <div tabindex="0"></div>
      """
    When I test the "Tab index: Zero Tab index must only be set on elements which are focusable by default" standard
    Then it fails with the message:
      """
      Non-focusable element with tabindex=0: /html/body/div[2]
      """

    Scenario: Unfocusable element with zero Tab index
      Given a page with the body:
        """
        <a href="/news" tabindex="1">News</a>
        <button type="submit" tabindex="2">Search</button>
        <div tabindex="3"></div>
        <div tabindex="0" style="display:none"></div>
        """
      When I test the "Tab index: Zero Tab index must only be set on elements which are focusable by default" standard
      Then it passes

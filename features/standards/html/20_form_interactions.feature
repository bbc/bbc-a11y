Feature: Form interactions

  Forms must have a submit button and forms must not update the location of the
  page on change, focus, or blur events.

  All `<form>` elements that take user input (i.e. do not consist only of
  `input[type=hidden]` elements to store state) **must** have a submit button in
  the form of a `<input>[type=submit,image]` or `<button>[type=submit]` element.

  Changes to the page location **must** must only take place on explicit user
  action i.e. when a submit button is activated. They must not take place when
  change (particularly for `select` elements), focus, or blur events are fired.

  Rationale
  =========

  All forms should have a submit button to provide a clear call to action. This
  is particularly important to users with cognitive disabilities, but is also
  beneficial to low vision users as an indication of the end of the form.

  Scenario: Form with a submit input
    Given a page with the body:
      """
      <form action="/search">
        <label for="q">Search term:</label>
        <input type="text" name="q" id="q">
        <input type="submit" value="Search">
      </form>
      """
    When I test the "Form interactions: Forms must have submit buttons" standard
    Then it passes

  Scenario: Form with an image input
    Given a page with the body:
      """
      <form action="/search">
        <label for="q">Search term:</label>
        <input type="text" name="q" id="q">
        <input type="image" src="some.png">
      </form>
      """
    When I test the "Form interactions: Forms must have submit buttons" standard
    Then it passes

  Scenario: Form with no submit button
    Given a page with the body:
      """
      <form action="/search">
        <label for="q">Search term:</label>
        <input type="text" name="q" id="q">
      </form>
      """
    When I test the "Form interactions: Forms must have submit buttons" standard
    Then it fails with the message:
      """
      Form has no submit button: /html/body/form
      """

  Scenario: Form with a submit button
    Given a page with the body:
      """
      <form action="/search">
        <label for="q">Search term:</label>
        <input type="text" name="q" id="q">
        <button type="submit">Search</button>
      </form>
      """
    When I test the "Form interactions: Forms must have submit buttons" standard
    Then it passes

  Scenario: Hidden form with no submit button
    Given a page with the body:
      """
      <form action="/search" style="display: none">
        <label for="q">Search term:</label>
        <input type="text" name="q" id="q">
      </form>
      """
    When I test the "Form interactions: Forms must have submit buttons" standard
    Then it passes

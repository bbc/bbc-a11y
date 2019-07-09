Feature: Changing focus

  Focus or context must not automatically change during user input.

  Content that updates on input can be confusing, especially to users 
  of screen readers and screen magnification software, and people with 
  cognitive impairment.

  In forms it can be disorienting and hinder users from verifying 
  information or correcting mistakes if the focus automatically changes 
  when the user is not expecting it. For example, moving to the next 
  control or to a validation error message during input.

  Focus must only change when activated by the user. This could be via 
  mouse or touch, using ‘tab’ or ‘flicking’ to change form control, or 
  using ‘space’ or ‘enter’ to activate a button.

  This guideline is particularly important when creating forms.

  HTML Applicability
  ==================

  Changes to the page location **must** must only take place on explicit user
  action i.e. when a submit button is activated. They must not take place when
  change (particularly for `select` elements), focus, or blur events are fired.

  All forms should have a submit button to provide a clear call to action. This
  is particularly important to users with cognitive disabilities, but is also
  beneficial to low vision users as an indication of the end of the form.

  @html @automated
  Scenario: Form with a submit input
    Given a page with the body:
      """
      <form action="/search">
        <label for="q">Search term:</label>
        <input type="text" name="q" id="q">
        <input type="submit" value="Search">
      </form>
      """
    When I test the "Focus: Changing focus: Forms must have submit buttons" standard
    Then it passes

  @html @automated
  Scenario: Form with an image input
    Given a page with the body:
      """
      <form action="/search">
        <label for="q">Search term:</label>
        <input type="text" name="q" id="q">
        <input type="image" src="some.png">
      </form>
      """
    When I test the "Focus: Changing focus: Forms must have submit buttons" standard
    Then it passes

  @html @automated
  Scenario: Form with no submit button
    Given a page with the body:
      """
      <form action="/search">
        <label for="q">Search term:</label>
        <input type="text" name="q" id="q">
      </form>
      """
    When I test the "Focus: Changing focus: Forms must have submit buttons" standard
    Then it fails with the message:
      """
      Form has no submit button: /html/body/form
      """

  @html @automated
  Scenario: Form with a submit button
    Given a page with the body:
      """
      <form action="/search">
        <label for="q">Search term:</label>
        <input type="text" name="q" id="q">
        <button type="submit">Search</button>
      </form>
      """
    When I test the "Focus: Changing focus: Forms must have submit buttons" standard
    Then it passes

  @html @automated
  Scenario: Hidden form with no submit button
    Given a page with the body:
      """
      <form action="/search" style="display: none">
        <label for="q">Search term:</label>
        <input type="text" name="q" id="q">
      </form>
      """
    When I test the "Focus: Changing focus: Forms must have submit buttons" standard
    Then it passes

  @html @manual
  Scenario: Focus or context does not automatically change during user input (manual pass)
    Given I am performing a manual test of the "Focus: Changing focus: Focus or context must not automatically change during user input" standard
    And I have been asked "Does focus or context automatically change during user input?"
    When I answer "No (or not applicable)"
    Then the manual test passes

  @html @manual
  Scenario: Focus or context changes automatically during user input (manual fail)
    Given I am performing a manual test of the "Focus: Changing focus: Focus or context must not automatically change during user input" standard
    And I have been asked "Does focus or context automatically change during user input?"
    When I answer "Yes"
    Then the manual test fails

Feature: Form labels

  Form fields that allow input (`select`, and `textarea` elements, and all
  `input` element types other than image, submit, reset, button, or hidden)
  **must** have an associated label, either in the form of a `<label>` element
  or, for simple forms when no visible label is required, a `title` attribute.

  Rationale
  ---------

  Form labels are important for all users in order to understand what the form
  field is however they are essential for speech output users who cannot easily
  infer what the form element is by looking at the surrounding content.

  While there are WAI-ARIA attributes that allow for labelling of forms it is
  not supported in all versions of assistive technologies that BBC users could
  reasonably expect to be able to use.

  Scenario: All fields have labels or Title attributes
    Given a page with the body:
      """
      <label for="search">Search the BBC</label>
      <input type="text" id="search" name="q" />

      <label for="search2">
        Search the BBC
        <input id="search2" type="text" name="q" />
      </label>

      <input type="text" name="q" title="Search the BBC" />
      """
    When I test the "Form labels: Fields must have labels or titles" standard
    Then it passes

  Scenario: Some fields without labels or Title attributes
    Given a page with the body:
      """
      <input type="text" name="name" title="Name" />
      <input type="email" name="email" title="Email" />

      <textarea name="notes"></textarea>
      <select name="preference"></select>
      <input type="text" name="q" value="Search the BBC" />
      <input type="text" name="q" aria-label="Search the BBC" />
      <input type="text" name="q" placeholder="Search the BBC" />
      """
    When I test the "Form labels: Fields must have labels or titles" standard
    Then it fails with the message:
      """
      Field has no label or title attribute: /html/body/textarea
      Field has no label or title attribute: /html/body/select
      Field has no label or title attribute: /html/body/input[3]
      Field has no label or title attribute: /html/body/input[4]
      Field has no label or title attribute: /html/body/input[5]
      """

  Scenario: Hidden input fields
    Given a page with the body:
      """
      <input type="text" name="name" style="display: none" />
      <textarea name="text" style="display: none"></textarea>
      <select name="select" style="display: none"></textarea>
      """
    When I test the "Form labels: Fields must have labels or titles" standard
    Then it passes

  Scenario: Hidden fields do not need labels or Title attributes
    Given a page with the body:
      """
      <input type=hidden name=a value=b>
      """
    When I test the "Form labels: Fields must have labels or titles" standard
    Then it passes

  Scenario: Submit buttons do not need Title attributes or labels
    Given a page with the body:
      """
      <input type=submit name=a value=b>
      """
    When I test the "Form labels: Fields must have labels or titles" standard
    Then it passes

  Scenario: Reset inputs do not need labels or Title attributes
    Given a page with the body:
      """
      <input type=reset name=a value=b>
      """
    When I test the "Form labels: Fields must have labels or titles" standard
    Then it passes

  Scenario: Submit inputs do not need labels or Title attributes
    Given a page with the body:
      """
      <input type="submit" />
      """
    When I test the "Form labels: Fields must have labels or titles" standard
    Then it passes

  Scenario: Reset inputs do not need labels or Title attributes
    Given a page with the body:
      """
      <input type="reset" />
      """
    When I test the "Form labels: Fields must have labels or titles" standard
    Then it passes

  Scenario: Image inputs do not need labels or Title attributes
    Given a page with the body:
      """
      <input type="image" />
      """
    When I test the "Form labels: Fields must have labels or titles" standard
    Then it passes

  Scenario: Buttons do not need labels or Title attributes
    Given a page with the body:
      """
      <button>Boo</button>
      """
    When I test the "Form labels: Fields must have labels or titles" standard
    Then it passes

  Scenario: Buttons need text
    Given a page with the body:
      """
      <button></button>
      """
    When I test the "Form labels: Fields must have labels or titles" standard
    Then it fails with the message:
      """
      Button has no text: /html/body/button
      """

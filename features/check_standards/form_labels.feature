Feature: Correctly use form labels

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

  Scenario: All fields have labels or title attributes
    Given a page with the HTML:
      """
      <label for="search">Search the BBC</label>
      <input type="text" id="search" name="q" />

      <label for="search2">
        Search the BBC
        <input id="search2" type="text" name="q" />
      </label>

      <input type="text" name="q" title="Search the BBC" />
      """
    When I validate the "fields must have labels or titles" standard
    Then it passes

  Scenario: Some fields without labels or title attributes
    Given a page with the HTML:
      """
      <input type="text" name="name" title="Name" />
      <input type="email" name="email" title="Email" />

      <textarea name="notes"></textarea>
      <select name="preference"></select>
      <input type="text" name="q" value="Search the BBC" />
      <input type="text" name="q" aria-label="Search the BBC" />
      <input type="text" name="q" placeholder="Search the BBC" />
      """
    When I validate the "fields must have labels or titles" standard
    Then it fails with the message:
      """
      Field has no label or title attribute: /html/body/textarea
      Field has no label or title attribute: /html/body/select
      Field has no label or title attribute: /html/body/input[3]
      Field has no label or title attribute: /html/body/input[4]
      Field has no label or title attribute: /html/body/input[5]
      """

  Scenario: Hidden fields do not need titles

    Given a page with the HTML:
      """
      <input type=hidden name=a value=b>
      """
    When I validate the "fields must have labels or titles" standard
    Then it passes

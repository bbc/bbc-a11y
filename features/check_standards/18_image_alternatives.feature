Feature: Image alternatives

  All images **must** have an alt attribute.

  All editorial significant images **must** have a non-null alt attribute value,
  or a text alternative in the preceding or following content.

  Rationale
  =========

  Assistive technologies such as screen readers will provide a text alternative
  for images that do not have alt attributes based on the image file name. For
  images that do not have editorial significance or are described in the
  surrounding text content it is appropriate to use a null (alt="") value for
  the image alt attribute to avoid this.

  All editorially significantly images must have a text alternative either as
  the value of the alt attribute or in the immediately surrounding text content.

  Scenario: Images with alt attributes
    Given a page with the body:
      """
      <img src="a.jpeg" alt="A picture of something" />
      <img src="b.jpeg" alt="" />
      """
    When I test the "Image alternatives: Images must have alt attributes" standard
    Then it passes

  Scenario: Images without alt attributes
    Given a page with the body:
      """
      <img src="a.jpeg" alt="A picture of something" />
      <img src="b.jpeg" />
      """
    When I test the "Image alternatives: Images must have alt attributes" standard
    Then it fails with the message:
      """
      Image has no alt attribute: /html/body/img[2]
      """

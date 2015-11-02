Feature: Headings

  A document **must** have exactly one `<h1>` element.

  Heading levels after the document `<h1>` element **must** be sequential and **must not** skip heading levels.

  Heading elements **must** be followed by content.

  Rationale
  =========

  A logical heading structure is invaluable for users of screen readers and similar assistive technologies to help navigate content.

  Users should be able to use the document's `<h1>` identify its main content. Documents should have one main subject.

  Heading levels should not be skipped as a predictable document outline is an important factor for understandability.

  Headings should not be used for non-heading purposes, i.e. to identify blocks of content. A heading should always
  be followed either by non-heading content or by a heading of one level deeper.

  Scenario: No main heading
    Given a page with the HTML:
      """
      <h2>Heading 2</h2>
      """
    When I validate the heading standards
    Then it fails with the message:
    """
    A document must have exactly one heading. Found 0 h1 elements.
    """

  Scenario: More than one main heading
    Given a page with the HTML:
      """
      <h1>Heading 1</h1>
      <h2>Heading 2</h2>
      <h1>Heading 1</h1>
      """
    When I validate the heading standards
    Then it fails with the message:
    """
    A document must have exactly one heading. Found 2 h1 elements.
    """

  Scenario: Headings in ascending order
    Given a page with the HTML:
      """
      <h1>Heading 1</h1>
      <h2>Heading 2</h2>
      <h3>Heading 3</h3>
      <h4>Heading 4</h4>
      <h5>Heading 5</h5>
      <h6>Heading 6</h6>
      """
    When I validate the heading standards
    Then it passes

  Scenario: Headings in invalid order
    Given a page with the HTML:
      """
      <h1>Heading 1</h1>
      <h3>Heading 3</h3>
      <h2>Heading 2</h2>
      """
    When I validate the heading standards
    Then it fails with the message:
      """
      Headings were not in order: h1 is followed by h3
      """

  Scenario: Headings jump back up more than one level
    Given a page with the HTML:
      """
      <h1>Heading 1</h1>
      <h2>Heading 2</h2>
      <h3>Heading 3</h3>
      <h4>Heading 4</h4>
      <h2>Heading 2b</h2>
      <h3>Heading 3b</h3>
      """
    When I validate the heading standards
    Then it passes

  Scenario: Heading is hidden
    Given a page with the HTML:
      """
      <h1>Heading 1</h1>
      <h3 style="display:none">Heading 3</h3>
      <h2>Heading 2</h2>
      """
    When I validate the heading standards
    Then it fails with the message:
      """
      Headings were not in order: h1 is followed by h3
      """

  Scenario: Heading in a script tag
    Given a page with the HTML:
      """
      <h1>Heading 1</h1>
      <script>
        var stuff = "<h3>Heading 3</h3>";
      </script>
      <h2>Heading 2</h2>
      """
    When I validate the heading standards
    Then it passes

  Scenario: Subheading before the first main heading
    Given a page with the HTML:
      """
      <h3>Ignore me</h3>
      <h1>Heading 1</h1>
      <h2>Heading 2</h2>
      """
    When I validate the heading standards
    Then it passes

    Scenario: Content between headings
      Given a page with the HTML:
        """
        <div role="main">
          <h1>Main heading</h1>
          <p>non-heading content</p>
          <h2>Another heading</h2>
          <p>non-heading content</p>
          <h3>Main content</h3>
          <h2>Secondary content</h2>
          <p>non-heading content</p>
          <h2>Tertiary content</h2>
          <p>Lorem ipsum…</p>
        </div>
        """
      When I validate the heading standards
      Then it passes

  Scenario: No content between headings
    Given a page with the HTML:
      """
      <div role="main">
        <h1>Main heading</h1>
        <p>non-heading content</p>
        <h3>Main content</h3>
        <h2>Secondary content</h2>
        <h2>Tertiary content</h2>
        <p>non-heading content</p>
      </div>
      """
    When I validate the heading standards
    Then it fails with the message:
      """
      Heading elements must be followed by content. No content follows a h2.
      """

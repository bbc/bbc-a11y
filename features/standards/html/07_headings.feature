Feature: Headings

  A document **must** have exactly one `<h1>` element.

  Heading levels after the document `<h1>` element **must** be sequential and
  **must not** skip heading levels.

  Heading elements **must** be followed by content.

  Rationale
  =========

  A logical heading structure is invaluable for users of screen readers and
  similar assistive technologies to help navigate content.

  Users should be able to use the document's `<h1>` identify its main content.
  Documents should have one main subject.

  Heading levels should not be skipped as a predictable document outline is an
  important factor for understandability.

  Headings should not be used for non-heading purposes, i.e. to identify blocks
  of content. A heading should always be followed either by non-heading content
  or by a heading of one level deeper.

  Scenario: No main heading
    Given a page with the body:
      """
      <h2>Heading 2</h2>
      """
    When I test the "Headings: Exactly one main heading" standard
    Then it fails with the message:
      """
      Found 0 h1 elements.
      """

  Scenario: More than one main heading
    Given a page with the body:
      """
      <h1>Heading 1</h1>
      <h2>Heading 2</h2>
      <h1>Heading 1</h1>
      """
    When I test the "Headings: Exactly one main heading" standard
    Then it fails with the message:
      """
      Found 2 h1 elements: /html/body/h1[1] /html/body/h1[2]
      """

  Scenario: More than one main heading, but only one visible
    Given a page with the body:
      """
      <h1>A Heading</h1>
      <h1 style="display:none">Another Heading</h1>
      """
    When I test the "Headings: Exactly one main heading" standard
    Then it passes

  Scenario: Headings in ascending order
    Given a page with the body:
      """
      <h1>Heading 1</h1>
      <h2>Heading 2</h2>
      <h3>Heading 3</h3>
      <h4>Heading 4</h4>
      <h5>Heading 5</h5>
      <h6>Heading 6</h6>
      """
    When I test the "Headings: Headings must be in ascending order" standard
    Then it passes

  Scenario: Headings in invalid order
    Given a page with the body:
      """
      <h1>Heading 1</h1>
      <h3>Heading 3</h3>
      <h2>Heading 2</h2>
      """
    When I test the "Headings: Headings must be in ascending order" standard
    Then it fails with the message:
      """
      Headings are not in order: /html/body/h1 /html/body/h3
      """

  Scenario: Headings jump back up more than one level
    Given a page with the body:
      """
      <h1>Heading 1</h1>
      <h2>Heading 2</h2>
      <h3>Heading 3</h3>
      <h4>Heading 4</h4>
      <h2>Heading 2b</h2>
      <h3>Heading 3b</h3>
      """
    When I test the "Headings: Headings must be in ascending order" standard
    Then it passes

  Scenario: Heading is hidden
    Given a page with the body:
      """
      <h1>Heading 1</h1>
      <h3 style="display:none">Heading 3</h3>
      <h2>Heading 2</h2>
      """
    When I test the "Headings: Headings must be in ascending order" standard
    Then it fails with the message:
      """
      Headings are not in order: /html/body/h1 /html/body/h3
      """

  Scenario: Heading in a script tag
    Given a page with the body:
      """
      <h1>Heading 1</h1>
      <script>
        var stuff = "<h3>Heading 3</h3>";
      </script>
      <h2>Heading 2</h2>
      """
    When I test the "Headings: Headings must be in ascending order" standard
    Then it passes

  Scenario: Subheading before the first main heading
    Given a page with the body:
      """
      <h3>Ignore me</h3>
      <h1>Heading 1</h1>
      <h2>Heading 2</h2>
      """
    When I test the "Headings: Headings must be in ascending order" standard
    Then it passes with the warning:
      """
      First heading was not a main heading: /html/body/h3
      """

  Scenario: Content between headings
    Given a page with the body:
      """
      <div role="main">
        <h1>Main heading</h1>
        <p>non-heading content</p>
        <h2>Another heading</h2>
        <p>non-heading content</p>
        <h3>Main content</h3>
        non-heading content
        <h2>Secondary content</h2>
        <p>non-heading content</p>
        <h2>Tertiary content</h2>
        non-heading content
      </div>
      """
    When I test the "Headings: Content must follow headings" standard
    Then it passes

  Scenario: Heading followed by subheading
    Given a page with the body:
      """
      <h1>Main heading</h1>
      <h2>Another heading</h2>
      <p>...and some content</p>
      """
    When I test the "Headings: Content must follow headings" standard
    Then it passes

  Scenario: No content between headings
    Given a page with the body:
      """
      <div role="main">
        <h1>Main heading</h1>
        <p>non-heading content</p>
        <h2>Secondary content</h2>
        <h2>Tertiary content</h2>
        <p>non-heading content</p>
      </div>
      """
    When I test the "Headings: Content must follow headings" standard
    Then it fails with the message:
      """
      No content follows: /html/body/div/h2[1]
      """

  Scenario: Nested heading followed by heading of the same level
    Given a page with the body:
      """
      <h1>Main heading</h1>
      <div>
        <h2>Subheading</h2>
      </div>
      <h2>Another subheading</h2>
      Content
      """
    When I test the "Headings: Content must follow headings" standard
    Then it fails with the message:
      """
      No content follows: /html/body/div/h2
      """

  Scenario: Nested heading followed by non-nested content
    Given a page with the body:
      """
      <div>
        <h1>Main heading</h1>
      </div>
      Followed by some content
      """
    When I test the "Headings: Content must follow headings" standard
    Then it passes

  Scenario: Nested heading followed by nested content
    Given a page with the body:
      """
      <div>
        <h1>Main heading</h1>
      </div>
      <div>
        Followed by some content
      </div>
      """
    When I test the "Headings: Content must follow headings" standard
    Then it passes

  Scenario: Nested heading surrounded by no whitespace followed by content
    Given a page with the body:
      """
      <div>
        <div><h1>News headlines</h1></div>
        Content
      </div>
      """
    When I test the "Headings: Content must follow headings" standard
    Then it passes

  Scenario: Doubly-nested heading surrounded by no whitespace followed by content
    Given a page with the body:
      """
      <div>
        <div><div><h1>News headlines</h1></div></div>
        Content
      </div>
      """
    When I test the "Headings: Content must follow headings" standard
    Then it passes

  Scenario: Non-nested heading followed by nested content
    Given a page with the body:
      """
      <h1>Main heading</h1>
      <div>
        Followed by some content
      </div>
      """
    When I test the "Headings: Content must follow headings" standard
    Then it passes

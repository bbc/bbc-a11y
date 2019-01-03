Feature: Headings

  Content must provide a logical and hierarchical heading structure, as
  supported by the platform.

  A good heading structure enables people to scan a page/screen quickly and
  understand the structure of the content. Screen reader users can also use
  headings to quickly navigate within a page or screen.

  Headings are standard for HTML, and available on iOS since iOS6. Android does
  not have a way to distinguish headings programmatically, however some
  elements, such as tables and listviews, do have headers.

  HTML Applicability
  ==================

  A document **must** have exactly one `<h1>` element.

  Heading levels after the document `<h1>` element **must** be sequential and
  **must not** skip heading levels.

  Heading elements **must** be followed by content.

  A logical heading structure is invaluable for users of screen readers and
  similar assistive technologies to help navigate content.

  Users should be able to use the document's `<h1>` identify its main content.
  Documents should have one main subject.

  Heading levels should not be skipped as a predictable document outline is an
  important factor for understandability.

  Headings should not be used for non-heading purposes, i.e. to identify blocks
  of content. A heading should always be followed either by non-heading content
  or by a heading of one level deeper.

  @html @automated
  Scenario: No main heading
    Given a page with the body:
      """
      <h2>Heading 2</h2>
      """
    When I test the "Structure: Headings: Exactly one main heading" standard
    Then it fails with the message:
      """
      Found 0 h1 elements.
      """

  @html @automated
  Scenario: More than one main heading
    Given a page with the body:
      """
      <h1>Heading 1</h1>
      <h2>Heading 2</h2>
      <h1>Heading 1</h1>
      """
    When I test the "Structure: Headings: Exactly one main heading" standard
    Then it fails with the message:
      """
      Found 2 h1 elements: /html/body/h1[1] /html/body/h1[2]
      """

  @html @automated
  Scenario: More than one main heading, but only one visible
    Given a page with the body:
      """
      <h1>A Heading</h1>
      <h1 style="display:none">Another Heading</h1>
      """
    When I test the "Structure: Headings: Exactly one main heading" standard
    Then it passes

  @html @automated
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
    When I test the "Structure: Headings: Headings must be in ascending order" standard
    Then it passes

  @html @automated
  Scenario: Headings in invalid hierarchical order
    Given a page with the body:
      """
      <h1>Heading 1</h1>
      <h3>Heading 3</h3>
      <h2>Heading 2</h2>
      """
    When I test the "Structure: Headings: Headings must be in ascending order" standard
    Then it fails with the message:
      """
      Headings are not in order: /html/body/h1 /html/body/h3
      """

  @html @automated
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
    When I test the "Structure: Headings: Headings must be in ascending order" standard
    Then it passes

  @html @automated
  Scenario: Heading is hidden
    Given a page with the body:
      """
      <h1>Heading 1</h1>
      <h3 style="display:none">Heading 3</h3>
      <h2>Heading 2</h2>
      """
    When I test the "Structure: Headings: Headings must be in ascending order" standard
    Then it fails with the message:
      """
      Headings are not in order: /html/body/h1 /html/body/h3
      """

  @html @automated
  Scenario: Heading in a script tag
    Given a page with the body:
      """
      <h1>Heading 1</h1>
      <script>
        var stuff = "<h3>Heading 3</h3>";
      </script>
      <h2>Heading 2</h2>
      """
    When I test the "Structure: Headings: Headings must be in ascending order" standard
    Then it passes

  @html @automated
  Scenario: Subheading before the first main heading
    Given a page with the body:
      """
      <h2>Heading 2a</h2>
      <h3>Heading 3</h3>
      <h1>Heading 1</h1>
      <h2>Heading 2b</h2>
      """
    When I test the "Structure: Headings: Headings must be in ascending order" standard
    Then it passes

  @html @automated
  Scenario: Level 3 heading before the first main heading
    Given a page with the body:
      """
      <h3>Ignore me</h3>
      <h1>Heading 1</h1>
      <h2>Heading 2</h2>
      """
    When I test the "Structure: Headings: Headings must be in ascending order" standard
    Then it passes with the warning:
      """
      First heading was not a level 1 or level 2 heading: /html/body/h3
      """

  @html @automated
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
    When I test the "Structure: Headings: Content must follow headings" standard
    Then it passes

  @html @automated
  Scenario: Heading followed by subheading
    Given a page with the body:
      """
      <h1>Main heading</h1>
      <h2>Another heading</h2>
      <p>...and some content</p>
      """
    When I test the "Structure: Headings: Content must follow headings" standard
    Then it passes

  @html @automated
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
    When I test the "Structure: Headings: Content must follow headings" standard
    Then it fails with the message:
      """
      No content follows: /html/body/div/h2[1]
      """

  @html @automated
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
    When I test the "Structure: Headings: Content must follow headings" standard
    Then it fails with the message:
      """
      No content follows: /html/body/div/h2
      """

  @html @automated
  Scenario: Nested heading followed by non-nested content
    Given a page with the body:
      """
      <div>
        <h1>Main heading</h1>
      </div>
      Followed by some content
      """
    When I test the "Structure: Headings: Content must follow headings" standard
    Then it passes

  @html @automated
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
    When I test the "Structure: Headings: Content must follow headings" standard
    Then it passes

  @html @automated
  Scenario: Nested heading surrounded by no whitespace followed by content
    Given a page with the body:
      """
      <div>
        <div><h1>News headlines</h1></div>
        Content
      </div>
      """
    When I test the "Structure: Headings: Content must follow headings" standard
    Then it passes

  @html @automated
  Scenario: Doubly-nested heading surrounded by no whitespace followed by content
    Given a page with the body:
      """
      <div>
        <div><div><h1>News headlines</h1></div></div>
        Content
      </div>
      """
    When I test the "Structure: Headings: Content must follow headings" standard
    Then it passes

  @html @automated
  Scenario: Non-nested heading followed by nested content
    Given a page with the body:
      """
      <h1>Main heading</h1>
      <div>
        Followed by some content
      </div>
      """
    When I test the "Structure: Headings: Content must follow headings" standard
    Then it passes

  @html @automated
  Scenario: Heading followed by nested heading
    Given a page with the body:
    """
    <h1>Main heading</h1>
    <h2>This is a sub-heading</h2>
    <div>
      <h2>Another h2 heading</h2>
      <p>Hello</p>
    </div>
    """
    When I test the "Structure: Headings: Content must follow headings" standard
    Then it fails with the message:
      """
      No content follows: /html/body/h2
      """

  @html @automated
  Scenario: Heading followed by nested heading after a p tag with only a space
    Given a page with the body:
    """
    <h1>Main heading</h1>
    <h2>This is a sub-heading</h2>
    <div>
      <p> </p>
      <h2>Another h2 heading</h2>
      <p>Hello</p>
    </div>
    """
    When I test the "Structure: Headings: Content must follow headings" standard
    Then it fails with the message:
      """
      No content follows: /html/body/h2
      """

  @html @automated
  Scenario: Heading followed by nested heading after a p tag with only a space and an empty div
    Given a page with the body:
    """
    <h1>Main heading</h1>
    <h2>This is a sub-heading</h2>
    <div>
      <p> </p>
      <div> </div>
      <h2>Another h2 heading</h2>
      <p>Hello</p>
    </div>
    """
    When I test the "Structure: Headings: Content must follow headings" standard
    Then it fails with the message:
      """
      No content follows: /html/body/h2
      """

  @html @automated
  Scenario: Incorrect nested heading inside a div
    Given a page with the body:
    """
    <h1>Main heading</h1>
    <h2>This is a sub-heading</h2>
    <p>This is some text</p>
    <div>
      <p> </p>
      <div> </div>
      <h2>Another h2 heading</h2>
      <p> </p>
    </div>
    """
    When I test the "Structure: Headings: Content must follow headings" standard
    Then it fails with the message:
      """
      No content follows: /html/body/div/h2
      """

  @html @automated
  Scenario: Heading followed by nested heading after a non-empty p tag
    Given a page with the body:
    """
    <h1>Main heading</h1>
    <h2>This is a sub-heading</h2>
    <div>
      <p>Hello</p>
      <h2>Another h2 heading</h2>
      <p>Hello</p>
    </div>
    """
    When I test the "Structure: Headings: Content must follow headings" standard
    Then it passes

  @html @automated
  Scenario: Heading followed by empty iframe and h2 at same level
    Given a page with the body:
    """
    <h1>Main heading</h1>
    <h2>This is a sub-heading</h2>
    <iframe></iframe>
    <h2>This is a sub-heading</h2>
    <p>This is text</p>
    """
    When I test the "Structure: Headings: Content must follow headings" standard
    Then it fails with the message:
      """
      No content follows: /html/body/h2[1]
      """

  @html @automated
  Scenario: Heading followed by paragraph containing a space and h2 at same level
    Given a page with the body:
    """
    <h1>Main heading</h1>
    <h2>This is a sub-heading</h2>
    <p> </p>
    <h2>This is a sub-heading</h2>
    <p>This is text</p>
    """
    When I test the "Structure: Headings: Content must follow headings" standard
    Then it fails with the message:
      """
      No content follows: /html/body/h2[1]
      """

  @html @automated
  Scenario: Heading followed by an iframe with content
    Given a website running at http://localhost:54321
    And a page with the body:
      """
      <h1>Main heading</h1>
      <iframe src="http://localhost:54321/perfect.html"></iframe>
      """
    When I test the "Structure: Headings: Content must follow headings" standard
    Then it passes

  @html @automated
  Scenario: Heading followed by a nested iframe with content
    Given a website running at http://localhost:54321
    And a page with the body:
      """
      <h1>Main heading</h1>
      <div>
        <iframe src="http://localhost:54321/perfect.html"></iframe>
      </div>
      """
    When I test the "Structure: Headings: Content must follow headings" standard
    Then it passes

  @html @automated
  Scenario: Heading followed by an iframe without content and then an iframe with content
    Given a website running at http://localhost:54321
    And a page with the body:
      """
      <h1>Main heading</h1>
      <div>
        <iframe></iframe>
        <iframe src="http://localhost:54321/perfect.html"></iframe>
      </div>
      """
    When I test the "Structure: Headings: Content must follow headings" standard
    Then it passes

  @html @automated
  Scenario: Heading followed by an iframe without content
    Given a website running at http://localhost:54321
    And a page with the body:
      """
      <h1>Main heading</h1>
      <div>
        <iframe></iframe>
      </div>
      """
    When I test the "Structure: Headings: Content must follow headings" standard
    Then it fails with the message:
      """
      No content follows: /html/body/h1
      """

  @html @automated
  Scenario: Heading followed by a hidden iframe with content
    Given a website running at http://localhost:54321
    And a page with the body:
      """
      <h1>Main heading</h1>
      <iframe style="display: none" src="http://localhost:54321/perfect.html"></iframe>
      """
    When I test the "Structure: Headings: Content must follow headings" standard
    Then it fails with the message:
      """
      No content follows: /html/body/h1
      """

  @html @automated
  Scenario: Heading followed by a hidden nested iframe with content
    Given a website running at http://localhost:54321
    And a page with the body:
      """
      <h1>Main heading</h1>
      <div>
        <iframe style="display: none" src="http://localhost:54321/perfect.html"></iframe>
      </div>
      """
    When I test the "Structure: Headings: Content must follow headings" standard
    Then it fails with the message:
      """
      No content follows: /html/body/h1
      """

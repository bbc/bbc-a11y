Feature: Correctly use headings

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

  Techniques
  ==========

  Pass:

    <div role="main">
      <h1>Main page content</h1>
      <p>Lorem ipsum…</p>
      <h2>Secondary content</h2>
      <h3>Tertiary content one</h2>
      <ul>
        <li>Lorem</li>
      </ul>
      <h3>Tertiary content two</h3>
      <ul>
        <li>Ipsum</li>
      </ul>
    </div>

  Fail:

    <div role="main">
      <h3>Main content</h3>
      <h2>Secondary content</h2>
      <h2>Tertiary content</h2>
      <p>Lorem ipsum…</p>
    </div>

  Notes
  =====

  For the second test, can we check the next text node after each heading and test that it is 
  either not part of a heading element, or is part of a heading level of one level higher?

  Questions
  =========

  1. Clarify the note, above!
  2. Presumably it's OK for the hierarchy to jump *up* by more than 1? e.g. h1, h2, h3, h4, h2 is ok?

  Scenario: Check headings
    When I visit the page
    Then there must be exactly one h1 element
    And each heading must be followed by content or a heading of one level deeper (h2-h6)


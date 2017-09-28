Feature: Headings

  Content must provide a logical and hierarchical heading structure, as
  supported by the platform.

  A good heading structure enables people to scan a page/screen quickly and
  understand the structure of the content. Screen reader users can also use
  headings to quickly navigate within a page or screen.

  Headings are standard for HTML, and available on iOS since iOS6. Android does
  not have a way to distinguish headings programmatically, however some
  elements, such as tables and listviews, do have headers.

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

  Scenario: Headings in invalid order
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

  Scenario: Subheading before the first main heading
    Given a page with the body:
      """
      <h3>Ignore me</h3>
      <h1>Heading 1</h1>
      <h2>Heading 2</h2>
      """
    When I test the "Structure: Headings: Headings must be in ascending order" standard
    Then it passes with the warning:
      """
      First heading was not a main heading: /html/body/h3
      """

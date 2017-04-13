Feature: JUnit Reporter
  Scenario: Reporting results in JUnit format
    Given a website running at http://localhost:54321
    And a file named "a11y.js" with:
      """
      page("http://localhost:54321/perfect.html")
      page("http://localhost:54321/missing_main_heading.html")
      """
    When I run `bbc-a11y --reporter junit`
    Then it should fail with exactly:
      """
      <?xml version="1.0" encoding="UTF-8"?>
      <testsuites>
        <testsuite name="bbc-a11y" tests="15" failures="0" errors="0" skipped="0">
          <testcase classname="http://localhost:54321/perfect.html" name="Focusable controls: Anchors must have hrefs -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/focusable-controls.shtml"/>
          <testcase classname="http://localhost:54321/perfect.html" name="Form interactions: Forms must have submit buttons -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/form-interaction.shtml"/>
          <testcase classname="http://localhost:54321/perfect.html" name="Form labels: Fields must have labels or titles -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/form-labels.shtml"/>
          <testcase classname="http://localhost:54321/perfect.html" name="Headings: Content must follow headings -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/headings.shtml"/>
          <testcase classname="http://localhost:54321/perfect.html" name="Headings: Exactly one main heading -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/headings.shtml"/>
          <testcase classname="http://localhost:54321/perfect.html" name="Headings: Headings must be in ascending order -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/headings.shtml"/>
          <testcase classname="http://localhost:54321/perfect.html" name="Image alternatives: Images must have alt attributes -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/image-alt.shtml"/>
          <testcase classname="http://localhost:54321/perfect.html" name="Indicating language: Html must have lang attribute -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/language.shtml"/>
          <testcase classname="http://localhost:54321/perfect.html" name="Main landmark: Exactly one Main landmark -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/main-landmark.shtml"/>
          <testcase classname="http://localhost:54321/perfect.html" name="Minimum text size: Text cannot be too small -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/min-text-size.shtml"/>
          <testcase classname="http://localhost:54321/perfect.html" name="Tab index: Zero Tab index must only be set on elements which are focusable by default -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/tabindex.shtml"/>
          <testcase classname="http://localhost:54321/perfect.html" name="Tables: Use tables for data -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/tables.shtml"/>
          <testcase classname="http://localhost:54321/perfect.html" name="Title attributes: Title attributes must not duplicate content -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/title-attributes.shtml"/>
          <testcase classname="http://localhost:54321/perfect.html" name="Title attributes: Title attributes only on inputs -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/title-attributes.shtml"/>
          <testcase classname="http://localhost:54321/perfect.html" name="Visible on focus: Elements must be visible on focus -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/visible-on-focus.shtml"/>
        </testsuite>
        <testsuite name="bbc-a11y" tests="15" failures="1" errors="0" skipped="0">
          <testcase classname="http://localhost:54321/missing_main_heading.html" name="Focusable controls: Anchors must have hrefs -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/focusable-controls.shtml"/>
          <testcase classname="http://localhost:54321/missing_main_heading.html" name="Form interactions: Forms must have submit buttons -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/form-interaction.shtml"/>
          <testcase classname="http://localhost:54321/missing_main_heading.html" name="Form labels: Fields must have labels or titles -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/form-labels.shtml"/>
          <testcase classname="http://localhost:54321/missing_main_heading.html" name="Headings: Content must follow headings -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/headings.shtml"/>
          <testcase classname="http://localhost:54321/missing_main_heading.html" name="Headings: Exactly one main heading -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/headings.shtml">
            <failure message="Found 0 h1 elements."/>
          </testcase>
          <testcase classname="http://localhost:54321/missing_main_heading.html" name="Headings: Headings must be in ascending order -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/headings.shtml"/>
          <testcase classname="http://localhost:54321/missing_main_heading.html" name="Image alternatives: Images must have alt attributes -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/image-alt.shtml"/>
          <testcase classname="http://localhost:54321/missing_main_heading.html" name="Indicating language: Html must have lang attribute -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/language.shtml"/>
          <testcase classname="http://localhost:54321/missing_main_heading.html" name="Main landmark: Exactly one Main landmark -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/main-landmark.shtml"/>
          <testcase classname="http://localhost:54321/missing_main_heading.html" name="Minimum text size: Text cannot be too small -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/min-text-size.shtml"/>
          <testcase classname="http://localhost:54321/missing_main_heading.html" name="Tab index: Zero Tab index must only be set on elements which are focusable by default -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/tabindex.shtml"/>
          <testcase classname="http://localhost:54321/missing_main_heading.html" name="Tables: Use tables for data -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/tables.shtml"/>
          <testcase classname="http://localhost:54321/missing_main_heading.html" name="Title attributes: Title attributes must not duplicate content -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/title-attributes.shtml"/>
          <testcase classname="http://localhost:54321/missing_main_heading.html" name="Title attributes: Title attributes only on inputs -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/title-attributes.shtml"/>
          <testcase classname="http://localhost:54321/missing_main_heading.html" name="Visible on focus: Elements must be visible on focus -- http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/visible-on-focus.shtml"/>
        </testsuite>
      </testsuites>

      """

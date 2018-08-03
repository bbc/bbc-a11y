Feature: Content resizing

  Users must be able to control font sizing and user interface (UI) scaling.

  All users benefit when they can adapt the size of content to see and read it.
  This may be a constant or temporary adaption due, for example, to screen size,
  screen glare, or vision impairment.

  Ensure that content responds to platform native text resizing, and that
  scaling (or "zoom") is supported.

  Users who magnify or zoom in on content only see part of the screen. Try to
  keep on-screen changes close to the point of interaction. For example, if a
  user completes an input field incorrectly add a visual cue above, below or
  inside the field, rather than out to the side.

  HTML Applicability
  ==================

  * Text must be styled with units that are resizable in all browsers.

  * Content must be visible and usable with text resized to 200% of normal.

  * Content must be visible and usable with page zoomed to 200% of normal.

  * Where available on a platform zoom must be suported.

  Standard browser features for resizing text or page zoom can make content
  accessible to many low vision users without the need for additional assistive
  technologies such as screen magnifiers or screen readers.

  Text resizing and page zoom cater to different needs, and therefore both
  should be supported.

  Internet Explorer does not resize text that have been styled in px units,
  therefore em, % or similar units should be used.

  Browsers on iOS, Android, and other mobile platforms also support zoom with
  pinch-in and pinch-out gestures. In most cases it is just a matter of not
  disabling this, but there are some cases when it is appropriate to implement
  content specific interactions, such as with zoomable maps, which should mimic
  the same pinch-in and pinch-out gestures.

  Minimum Text Size
  -----------------

  Note: The mobile accessibility guidelines do *not* include anything regarding
  minimum text size. This guideline is based on the legacy HTML Accessibility
  Guidelines which you can find here:

  http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/min-text-size.shtml

  At default browser level all text **must** have a minimum calculated size of
  11px and all core content **must** have a minimum calculated size of 13px.

  Having a Minimum text size will reduce the number of users who need to make
  use of browser based text resize or page zoom. This is a particular issue with
  an ageing audience, many of whom will not consider themselves as having low
  vision and there will not have access to assistive technology or be familiar
  with browser tools to resize content.

  @html @automated
  Scenario: px styles inline and stylesheet
    Given a page with the body:
      """
      <p style="font-size: 16px">Styled in px!</p>
      <style>b { font-size: 18px }</style>
      <b>Styled in px!</b>
      """
    When I test the "Design: Content resizing: Text must be styled with units that are resizable in all browsers" standard
    Then it fails with the message:
      """
      Text styled with px unit: /html/body/p
      Text styled with px unit: /html/body/b
      """

  @html @automated
  Scenario: pt styles inline and stylesheet
    Given a page with the body:
      """
      <p style="font-size: 16pt">Styled in pt!</p>
      <style>b { font-size: 18pt }</style>
      <b>Styled in pt!</b>
      """
    When I test the "Design: Content resizing: Text must be styled with units that are resizable in all browsers" standard
    Then it fails with the message:
      """
      Text styled with pt unit: /html/body/p
      Text styled with pt unit: /html/body/b
      """

  @html @automated
  Scenario: em styles inline and stylesheet
    Given a page with the body:
      """
      <p style="font-size: 16em">Styled in em!</p>
      <style>b { font-size: 1.5em }</style>
      <b>Styled in em!</b>
      """
    When I test the "Design: Content resizing: Text must be styled with units that are resizable in all browsers" standard
    Then it passes

  @html @automated
  Scenario: em and px styles
    Given a page with the body:
      """
      <style>
        body { font-size: 20px }
        b { font-size: 1.5em }
      </style>
      <b>Styled in em but has px in the styles tree!</b>
      """
    When I test the "Design: Content resizing: Text must be styled with units that are resizable in all browsers" standard
    Then it fails with the message:
      """
      Text styled with px unit: /html/body/b
      """

  @html @automated
  Scenario: em and pt styles
    Given a page with the body:
      """
      <style>
        body { font-size: 20pt }
        b { font-size: 1.5em }
      </style>
      <b>Styled in em!</b>
      """
    When I test the "Design: Content resizing: Text must be styled with units that are resizable in all browsers" standard
    Then it fails with the message:
      """
      Text styled with pt unit: /html/body/b
      """

  @html @automated
  Scenario: px overriden by em styles
    Given a page with the body:
      """
      <style>
        b { font-size: 12px; font-size: 1.5em; }
      </style>
      <b>Styled in em!</b>
      """
    When I test the "Design: Content resizing: Text must be styled with units that are resizable in all browsers" standard
    Then it passes

  @html @automated
  Scenario: Small text
    Given a page with the body:
      """
      <style>
        body {
          font-size: 62.5%; /* Set default size of 1em to 10px */
        }

        b {
          font-size: 9px;
        }
      </style>
      <span>Some text</span> with <span>more <b>text</b> also</span>.
      """
    When I test the "Design: Content resizing: Text cannot be too small" standard
    Then it fails with the message:
      """
      Text size too small (10px): /html/body
      Text size too small (9px): /html/body/span[2]/b
      """

  @html @automated
  Scenario: Hidden elements with small text
    Given a page with the body:
      """
      <style>
        span { display: none; }
      </style>
      <span style="font-size: 1px">Tiny text, but it's hidden!</span>
      """
    When I test the "Design: Content resizing: Text cannot be too small" standard
    Then it passes

  @html @automated
  Scenario: Text nodes with only whitespace
    Given a page with the body:
      """
      <div id="blq-global" style="font-size: 1px"> <div id="blq-pre-mast">  </div> &nbsp;
      </div>
      """
    When I test the "Design: Content resizing: Text cannot be too small" standard
    Then it passes

  @html @automated
  Scenario: User agent stylesheet is ignored
    Given a page with the body:
      """
      <p>Not styled in px!</p>
      """
    When I test the "Design: Content resizing: Text must be styled with units that are resizable in all browsers" standard
    Then it passes

  @html @manual
  Scenario: Manual pass of "Content must be visible and usable with page zoomed to 200% of normal"
    Given I am performing a manual test of the "Design: Content resizing: Content must be visible and usable with page zoomed to 200% of normal" standard
    And I have been asked "Does the content scale when zoom or pinch-zoom is used?"
    When I answer "Yes"
    Then the manual test passes

  @html @manual
  Scenario: Manual fail of "Content must be visible and usable with page zoomed to 200% of normal"
    Given I am performing a manual test of the "Design: Content resizing: Content must be visible and usable with page zoomed to 200% of normal" standard
    And I have been asked "Does the content scale when zoom or pinch-zoom is used?"
    When I answer "No"
    Then the manual test fails

  @html @manual
  Scenario: Manual pass of "Content must be visible and usable with text resized to 200% of normal"
    Given I am performing a manual test of the "Design: Content resizing: Content must be visible and usable with text resized to 200% of normal" standard
    And I have been asked "Is the content visible and usable with the text resized to 200% or 50% of default?"
    When I answer "Yes"
    Then the manual test passes

  @html @manual
  Scenario: Manual fail of "Content must be visible and usable with text resized to 200% of normal"
    Given I am performing a manual test of the "Design: Content resizing: Content must be visible and usable with text resized to 200% of normal" standard
    And I have been asked "Is the content visible and usable with the text resized to 200% or 50% of default?"
    When I answer "No"
    Then the manual test fails

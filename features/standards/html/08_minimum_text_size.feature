Feature: Minimum text size

  At default browser level all text **must** have a minimum calculated size of
  11px and all core content **must** have a minimum calculated size of 13px.

  Rationale
  =========

  Having a Minimum text size will reduce the number of users who need to make
  use of browser based text resize or page zoom. This is a particular issue with
  an ageing audience, many of whom will not consider themselves as having low
  vision and there will not have access to assistive technology or be familiar
  with browser tools to resize content.

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
    When I test the "Minimum text size: Text cannot be too small" standard
    Then it fails with the message:
      """
      Text size too small (10px): /html/body
      Text size too small (9px): /html/body/span[2]/b
      """

    Scenario: Hidden elements with small text
      Given a page with the body:
        """
        <style>
          span { display: none; }
        </style>
        <span style="font-size: 1px">Tiny text, but it's hidden!</span>
        """
      When I test the "Minimum text size: Text cannot be too small" standard
      Then it passes

    Scenario: Text nodes with only whitespace
      Given a page with the body:
        """
        <div id="blq-global" style="font-size: 1px"> <div id="blq-pre-mast">  </div> &nbsp;
        </div>
        """
      When I test the "Minimum text size: Text cannot be too small" standard
      Then it passes

Feature: Visible On Focus

  Scenario: Element hidden using absolute top positioning
    Given a page with the body:
      """
      <style>
      .hidden {
        position: absolute;
        top: -999em;
      }
      </style>

      <div class="hidden">
        <a href="http://www.bbc.co.uk/">BBC</a>
      </div>
      """
    When I test the "Visible on focus: Elements must be visible on focus" standard
    Then it fails with the message:
      """
      Element is invisible on focus: /html/body/div/a
      """

  Scenario: Element hidden using absolute left positioning
    Given a page with the body:
      """
      <style>
      .hidden {
        position: absolute;
        left: -999em;
      }
      </style>

      <div class="hidden">
        <a href="http://www.bbc.co.uk/">BBC</a>
      </div>
      """
    When I test the "Visible on focus: Elements must be visible on focus" standard
    Then it fails with the message:
      """
      Element is invisible on focus: /html/body/div/a
      """

  Scenario: Element is visible
    Given a page with the body:
      """
      <a href="http://www.bbc.co.uk/">BBC</a>
      """
    When I test the "Visible on focus: Elements must be visible on focus" standard
    Then it passes

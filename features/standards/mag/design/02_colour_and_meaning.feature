Feature: Colour and meaning

  Information or meaning must not be conveyed by colour only.

  Colours can be difficult to distinguish in bright sunlight and cannot be
  perceived by users who are colour blind, or vision impaired. Screen readers do
  not detect colour and some users will change colour settings for their whole
  computer. For example, setting their computer to grayscale or applying a tint
  to help with reading. Lower specification mobile devices also offer poor
  colour support.

  Colour is often used to show:

  * a tab is selected,
  * a link is available,
  * text is an error message,
  * emphasis,
  * charts and graphics, or
  * other meaningful information.

  Additional visual and non-visual methods of identifying information or meaning
  must be applied to support the use of colour:

  * Visual cues could be text attributes with suitable mark up (such as
    underline, bold or italic), patterns, or icons with suitable alternative
    text;

  * Non-visual cues, which are programmatically available to assistive
    technologies, could be element tags, hidden text or suitable labels, for
    example ARIA or UlLabel.

  HTML Applicability
  ==================

  Information conveyed with colour must also be identifiable from context or
  markup.

  Users who are blind, have low vision, or have colour blindness may not be able
  to differentiate content (lines on a chart) or states (selected tabs) if
  colour alone is used.

  Alternatives must be provided for both sighted and non-sighted users, for
  example a table equivalent of a chart and lines differentiable with different
  styles (dashed, dotted, etc.).

  Background:
    Given I am performing a manual test of the "Design: Colour and meaning: Information conveyed with colour must also be identifiable from context or markup" standard
    And I have been asked "Is all information conveyed by colour also conveyed by other means, such as additional style, context or markup?"

  @html @manual
  Scenario: Manual pass
    When I answer "Yes (or not applicable)"
    Then the manual test passes

  @html @manual
  Scenario: Manual fail
    When I answer "No"
    Then the manual test fails

Feature: Images of text

  Images of text should be avoided.

  Images are an inflexible way to present text information. The text can blur
  when magnified or enlarged, is difficult to adapt for users wishing to change
  the colour, language or spacing, and is not available to assistive technology
  such as screen readers. Additionally, images can be slow to download and
  require more data.

  Sometimes it may be difficult to avoid using images of text, such as for brand
  logos or interactive content. If text can be read, it should also be available
  to assistive technology. Consider using methods such as SVG images, text
  alternatives, hidden text, and ARIA labels.

  Where available, use BBC Global Experience Language iconography. Icons should
  always have a consistent label, which is visible text when possible.

  Background:
    Given I am performing a manual test of the "Images: Images of text: Images of text should be avoided" standard
    And I have been asked "Are there unnecessary images of text?"

  Scenario: No images of text (manual pass)
    When I answer "No"
    Then the manual test passes

  Scenario: Images of text (manual fail)
    When I answer "Yes"
    Then the manual test fails

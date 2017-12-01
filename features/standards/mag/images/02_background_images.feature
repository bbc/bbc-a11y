Feature: Background images

  Background images that convey information or meaning must have an additional
  accessible alternative.

  Background images are not available to assistive technology such as screen
  readers and are not supported on devices with minimal support for CSS.
  Additionally, a background image may not load.

  It is not possible to directly assign alternative text to a CSS background
  image. Another method must also be used to provide the same information
  visibly, and in a way that is programmatically determinable by assistive
  technology, such as screen readers.

  Background:
    Given I am performing a manual test of the "Images: Background images: Meaningful background images must have accessible alternatives" standard
    And I have been asked "Are accessible alternatives provided for element background images that convey information or meaning?"

  @html @manual
  Scenario: Accessible alternatives are provided for background images that convey information or meaning (manual pass)
    When I answer "Yes (or not applicable)"
    Then the manual test passes

  @html @manual
  Scenario: No accessible alternatives are provided for background images that convey information or meaning (manual fail)
    When I answer "No"
    Then the manual test fails

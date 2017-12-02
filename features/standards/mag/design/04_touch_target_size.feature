Feature: Touch target size

  Touch targets must be large enough to touch accurately.

  All users benefit from larger touch targets. For young users, and users with
  motor and/or vision impairments, this is even more important as accuracy can
  be difficult.

  Content touch targets must be large enough to read and have a large enough
  interactive target area to tap comfortably with one finger.

  The recommended size of touch targets is 7 – 10mm. This size is equivalent to
  the smallest average finger. An interactive target area should be at least
  7 x 7 mm. If not, it must be no smaller than 5 x 5 mm inside an exclusion zone
  of at least 7 x 7 mm that does not overlap with any other touch target. The
  recommendation is to provide a bigger touch target where possible.

  Sometimes text that is big enough to read is too small to touch. For example,
  a linked letter in an A-Z listing would be too fine to touch accurately and
  should be placed in a linked container to increase the target area.

  Background:
    Given I am performing a manual test of the "Design: Touch target size: Touch targets must be large enough to touch accurately" standard
    And I have been asked "Are all touch targets large enough for accurate interaction (larger than 7mm x 7mm)?"

  @html @manual
  Scenario: Manual pass
    When I answer "Yes"
    Then the manual test passes

  @html @manual
  Scenario: Manual fail
    When I answer "No"
    Then the manual test fails

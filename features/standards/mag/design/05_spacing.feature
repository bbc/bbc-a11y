Feature: Spacing

  An inactive space should be provided around actionable elements.

  Anyone can find it challenging to interact with small controls that are
  closely grouped together, in particular users with motor or vision impairment.

  Actionable elements should not touch or overlap, and there should be an
  inactive space between actionable elements in order to reduce the risk of
  activating the wrong control. The minimum space possible to set on any device
  or screen resolution is 1 pixel, preferably the space would be larger.

  Background:
    Given I am performing a manual test of the "Design: Spacing: An inactive space should be provided around actionable elements" standard
    And I have been asked "Is an inactive space provided around every actionable element?"

  Scenario: Manual pass
    When I answer "Yes"
    Then the manual test passes

  Scenario: Manual fail
    When I answer "No"
    Then the manual test fails

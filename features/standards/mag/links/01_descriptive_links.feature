Feature: Descriptive links

  Link and navigation text must uniquely describe the target or function of the
  link or item.

  Unique links and navigation items are essential for screen reader and
  magnification users who may not perceive the context of a link or item. This
  is especially an issue for users who have not followed the content order.

  If link text is duplicated in a page or screen (e.g. Learn more..., More
  info..., Continue reading...) ways of making each link unique must also be
  used, for example, by using labels or hidden text.

  Background:
    Given I am performing a manual test of the "Links: Descriptive links: Link and navigation text must uniquely describe the target or function" standard
    And I have been asked "Does all link and navigation text uniquely describe the target or function of the link or item?"

  Scenario: Link and navigation text uniquely describes the target or function (manual pass)
    When I answer "Yes"
    Then the manual test passes

  Scenario: Link and navigation text does not uniquely describe the target or function (manual fail)
    When I answer "No"
    Then the manual test fails

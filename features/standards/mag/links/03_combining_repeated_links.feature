Feature: Combining repeated links

  Repeated links to the same resource must be combined within a single link.

  Grouping adjacent links to the same page or resource into a single link helps
  all users to navigate quickly, especially those using assistive technology,
  such as switch devices or screen readers. It reduces the number of elements to
  navigate, reduces screen reader verbosity, and also helps to increase touch
  target size.

  Repeated links, for example, could be an adjacent image, title and topic that
  all link to the same page or resource.

  Background:
    Given I am performing a manual test of the "Links: Combining repeated links: Repeated links to the same resource must be combined" standard
    And I have been asked "Are neighbouring elements linking to the same resource combined within a single link?"

  @html @manual
  Scenario: Repeated links to the same resource are combined within a single link (manual pass)
    When I answer "Yes (or not applicable)"
    Then the manual test passes

  @html @manual
  Scenario: Repeated links to the same resource (manual fail)
    When I answer "No"
    Then the manual test fails

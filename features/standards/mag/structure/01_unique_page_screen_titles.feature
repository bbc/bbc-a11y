Feature: Unique page/screen titles

  All pages or screens must be uniquely and clearly identifiable.

  The page/screen title is often the first thing people will see or hear and
  acts as a confirmation of where they have arrived at, helping people orientate
  themselves within websites and apps. It is particularly helpful for vision
  impaired users who cannot perceive the whole page/screen at once.

  Page titles are standard for HTML. Apps have the facility to add screen
  titles. However, when visible space is in short supply other means may be used
  to identify location, such as a logo on a homepage, the first item of content
  presented as a heading, or a selected tab on top navigation.

  Background:
    Given I am performing a manual test of the "Structure: Unique page/screen titles: Page titles must be uniquely and clearly identifiable" standard
    And I have been asked "Is the page title uniquely and clearly identifiable?"

  Scenario: Title uniquely and clearly identifiable (manual pass)
    When I answer "Yes"
    Then the manual test passes

  Scenario: Title not uniquely and clearly identifiable (manual fail)
    When I answer "No"
    Then the manual test fails

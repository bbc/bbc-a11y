Feature: Roles, traits and properties

  Elements must have accessibility properties set appropriately.

  Users of assistive technology, such as screen readers, rely on accessibility
  properties such as role, name, value, and state to be set appropriately in
  order to know how to identify and interact with an element or object.

  For example, on iOS a trait of 'button' must be set in order for a VoiceOver
  user to know what the element does and how to interact with it. With HTML
  content, if a user hears "button" they know to use the Enter key, if they hear
  "link" they know to use the Space Bar.

  Standard elements generally provide roles, traits and properties by default
  within the platform. Custom elements and objects will require all
  accessibility roles, traits and properties to be set.

  Background:
    Given I am performing a manual test of the "Text equivalents: Roles, traits and properties: Elements must have accessibility properties set appropriately" standard
    And I have been asked "Do elements have accessibility properties set appropriately?"

  @html @manual
  Scenario: Elements have accessibility properties set appropriately (manual pass)
    When I answer "Yes (or not applicable)"
    Then the manual test passes

  @html @manual
  Scenario: Elements do not have accessibility properties set appropriately (manual fail)
    When I answer "No"
    Then the manual test fails

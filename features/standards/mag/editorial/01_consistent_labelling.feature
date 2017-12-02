Feature: Consistent labelling
  Consistent labelling should be used across websites and native applications as
  well as within websites and applications.

  Consistency is important for all users to navigate confidently, whatever the
  device or product. It helps content and interactions quickly become familiar
  and recognisably BBC. Consistent labelling particularly helps screen reader
  users who do not have visual reinforcement to aid understanding.

  Labelling could be link text, headings, text for buttons, form fields, icons,
  text alternatives, page titles and so on.

  Text alternatives, labels and descriptions can influence the usability of
  items such as images, icons, buttons, links, and form elements.

  Tip: Sharing an up-to-date inventory between teams will ensure consistency for
  images and alternative text, form labels, and headings. This can be reinforced
  through style guidelines and templates.

  Background:
    Given I am performing a manual test of the "Editorial: Consistent labelling: Consistent labelling should be used" standard
    And I have been asked "Are consistent editorial labels used?"

  @html @manual
  Scenario: Manual pass
    When I answer "Yes (or not applicable)"
    Then the manual test passes

  @html @manual
  Scenario: Manual fail
    When I answer "No"
    Then the manual test fails

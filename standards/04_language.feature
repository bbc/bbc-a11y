Feature: Specify content language

  Scenario: Check main body element lang attribute
    When I visit the page
    Then the <html> element must have a `lang` attribute
    And the main natural language of the page must match that attribute

  Scenario: Check for other elements with lang attributes
    When I visit the page
    Then all elements with `lang` attribute must have content in that natural language

  @manual
  Scenario: Check for areas of the page expressed in other languages, but missing a `lang` attribute
    When I visit the page
    Then any parts expressed in a natural language different to the main language of the page must have a matching `lang` attribute

Feature: Visibility on focus

Scenario: Element should be visible on Focus

  @manual
	Given the page has "hidden_element"
	When I focus on the element with keyboard or mouse
	Then element should became visible

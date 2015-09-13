Feature: Visibility on focus

@manual
Scenario: Element should be visible on Focus

	Given the page has "hidden_element"
	When I focus on the element with keyboard or mouse
	Then element should became visible

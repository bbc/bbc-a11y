@manual
Feature: Focus Style

Scenario: Check the focus style of the elements

  Given the page has focusable elements on the page
	Then the focusable elements can be visually identified
	And the focusable element should change it's state when focused

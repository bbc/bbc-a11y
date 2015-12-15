@manual
Feature: Minimum font size

Scenario: Check minimum font size

  Given the page has full of text content
	Then the default browser level text should have minimum font size of 11px
	And the core content text should have minimum font size of 13px

@manual
Feature: Control Style Checks


Scenario: self eveident links

  Given the page has link
	Then the links should be underlined wth different color
	And the link should have mouse-over state

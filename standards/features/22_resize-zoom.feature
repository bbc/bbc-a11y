@manual
Feature: Resize-Zoom features

Scenario: Resize Zoon Feature

  Given the page is full of content
	When browser is resized to "<100>" percentage
	Then content should be accessible

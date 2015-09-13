@manual
Feature: Check Image alt tabs

Scenario: Check image alt tabs

  Given the page has multiple images
  Then all images must have alt atrributes

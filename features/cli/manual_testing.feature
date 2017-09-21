Feature: Manual Testing

  Scenario: Running manual tests
    Given a website running at http://localhost:54321
    When I run `bbc-a11y http://localhost:54321/perfect.html --manual`
    And I answer the following questions:
      | question                                                                                                                                                     | answer |
      | Is the core purpose (to inform, educate, or entertain) of this page clearly defined?                                                                         | Yes    |
      | Is information conveyed with colour also identifiable from context or markup?                                                                                | Yes    |
      | Do all colour combinations pass the Snook colour contrast check?                                                                                             | Yes    |
      | Are all links that are part of general editorial content self-evident, identifiable by their visual style, and distinguishable from the surrounding content? | Yes    |
      | Do all text links have a mouse over state change?                                                                                                            | Yes    |
      | Do all focusable elements have a clearly identifiable visual style when they have focus?                                                                     | Yes    |
      | Does the page function without JavaScript or CSS?                                                                                                            | Yes    |
      | Is the content visible and usable with the page zoomed to 200% of normal?                                                                                    | Yes    |
      | Is the content visible and usable with the text resized to 200% of normal?                                                                                   | Yes    |
    Then it should result in a pass for http://localhost:54321/perfect.html

  Scenario: Failing manual tests
    Given a website running at http://localhost:54321
    When I run `bbc-a11y http://localhost:54321/perfect.html --manual`
    And I answer the following questions:
      | question                                                                                                                                                     | answer |
      | Is the core purpose (to inform, educate, or entertain) of this page clearly defined?                                                                         | Yes    |
      | Is information conveyed with colour also identifiable from context or markup?                                                                                | Yes    |
      | Do all colour combinations pass the Snook colour contrast check?                                                                                             | Yes    |
      | Are all links that are part of general editorial content self-evident, identifiable by their visual style, and distinguishable from the surrounding content? | Yes    |
      | Do all text links have a mouse over state change?                                                                                                            | Yes    |
      | Do all focusable elements have a clearly identifiable visual style when they have focus?                                                                     | Yes    |
      | Does the page function without JavaScript or CSS?                                                                                                            | No     |
      | Is the content visible and usable with the page zoomed to 200% of normal?                                                                                    | Yes    |
      | Is the content visible and usable with the text resized to 200% of normal?                                                                                   | Yes    |
    Then it should result in a fail for http://localhost:54321/perfect.html

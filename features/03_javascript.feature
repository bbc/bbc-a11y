Feature: JavaScript

  Core experience must not rely on JavaScript or CSS (incomplete: techniques, tests)

  The core purpose of every document **must** be defined.

  The core purpose of every document **must not** require JavaScript or CSS to function.

  Rationale
  =========

  The 'Robustness' principle of WCAG 2.0 is intended to ensure the widest possible range of 
  devices / browsers / platforms are possible choices for people with disabilities. Factors
  beyond the users control may account for their choice of a browser with limited capabilities 
  or restrictions.

  Equally a robust site or application in the more traditional sense minimises its dependencies.
  The minimum dependency for a web site should be an internet connection and the ability to
  parse HTML.

  For this reason all BBC documents must enable their core purpose without relying on CSS 
  or JavaScript.

  CSS and JavaScript can, and should, be used to enhance the user experience beyond this 
  basic level. For example, a 'live' page has a core purpose to provide the latest content 
  about an event to the user. The core experience is the latest content at the time of the
  request. The experience enhanced with JavaScript automatically updates this content 
  without the user having to take action.

  Definitions
  ===========

  *Core experience* - The experience that is provided to users without CSS or JavaScript.

  Notes
  =====

  This is going to have to be a product specific test. Can we provide a template for this test, 
  perhaps looking for elements based on provided selectors and make sure they are in the document?

  @manual
  Scenario: View the page with JavaScript and CSS disabled
    When I view the page with JavaScript and CSS disabled
    Then all core content is available and functional


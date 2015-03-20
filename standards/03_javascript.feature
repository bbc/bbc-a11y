Feature: JavaScript

  Core experience must not rely on JavaScript

  The core purpose of every document **must** be defined.

  The core content of every document must not require JavaScript to be added to the DOM

  Rationale
  =========

  We aim to provide a core experience to as broad an audience as possible, allowing
  users to choose the software and devices that work best for them in a broad range of circumstances.

  Equally a robust site or application in the more traditional sense minimises its dependencies.
  The minimum dependency for a web site should be an internet connection and the ability to parse HTML.

  For this reason all BBC documents must enable their core purpose without relying on CSS or JavaScript.

  CSS and JavaScript can, and should, be used to enhance the user experience beyond this basic level.
  For example, a ‘live’ page has a core purpose to provide the latest content about an event to the user.
  The core experience is the latest content at the time of the request. The experience enhanced with
  JavaScript automatically updates this content without the user having to take action.

  Definitions
  ===========

  *Core content* - The content that is provided to users without JavaScript.

  Notes
  =====

  This is going to have to be a product specific test. Can we provide a template for this test, 
  perhaps looking for elements based on provided selectors and make sure they are in the document?

  @manual
  Scenario: View the page with JavaScript disabled
    When I view the page with JavaScript disabled
    Then all core content is available in the DOM


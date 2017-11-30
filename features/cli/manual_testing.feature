Feature: Manual Testing

  Scenario: Running manual tests
    Given a website running at http://localhost:54321
    When I run `bbc-a11y http://localhost:54321/perfect.html --manual`
    And I answer the following questions:
      | question                                                                                                                                                     | answer                  |
      | Is alternative delivery (such as subtitles, sign language, audio description and transcripts) provided with all embedded media?                              | Yes                     |
      | Does any audio that plays automatically make the user aware this will happen, or provide a pause/stop/mute button?                                           | Yes                     |
      | Is relevant metadata provided for all media?                                                                                                                 | Yes                     |
      | Are volume controls provided for all interactive media?                                                                                                      | Yes                     |
      | Is assistive technology uninterrupted by narrative audio?                                                                                                    | Yes                     |
      | Do all colour combinations pass the Snook colour contrast check?                                                                                             | Yes                     |
      | Is information conveyed with colour also identifiable from context or markup?                                                                                | Yes                     |
      | Is the core content of the page accessible without styling?                                                                                                  | Yes                     |
      | Are all touch targets large enough to touch accurately?                                                                                                      | Yes                     |
      | Is an inactive space provided around every actionable element?                                                                                               | Yes                     |
      | Is the content visible and usable with the page zoomed to 200% of normal?                                                                                    | Yes                     |
      | Is the content visible and usable with the text resized to 200% of normal?                                                                                   | Yes                     |
      | Do all links have underlines and pointers?                                                                                                                   | Yes                     |
      | Do all actionable and focusable elements visibly change state when focused?                                                                                  | Yes                     |
      | Is the user experience consistent?                                                                                                                           | Yes                     |
      | Does the interface provide multiple ways to interact with the content?                                                                                       | Yes                     |
      | Is any interactive media adjustable for user ability and preference?                                                                                         | Yes                     |
      | Does any content visibly or intentionally flicker or flash more than three times in any one-second period?                                                   | No                      |
      | Are consistent editorial labels used?                                                                                                                        | Yes                     |
      | Are changes to language indicated?                                                                                                                           | Yes (or not applicable) |
      | Are additional instructions provided to supplement visual and audio cues?                                                                                    | Yes (or not applicable) |
      | Are all interactive elements focusable?                                                                                                                      | Yes                     |
      | Is there a keyboard trap?                                                                                                                                    | No                      |
      | Is content logically ordered?                                                                                                                                | Yes                     |
      | Is actionable content navigable in a meaningful sequence?                                                                                                    | Yes                     |
      | Are actions triggered when appropriate for the type of user interaction?                                                                                     | Yes                     |
      | Are alternative input methods supported?                                                                                                                     | Yes (or not applicable) |
      | Are all form controls labelled?                                                                                                                              | Yes                     |
      | Is a default input format indicated and supported?                                                                                                           | Yes                     |
      | Are labels placed close to the relevant form control, and laid out appropriately?                                                                            | Yes                     |
      | Are controls, labels, and other form elements properly grouped?                                                                                              | Yes                     |
      | Does focus or context automatically change during user input?                                                                                                | No                      |
      | Are there unnecessary images of text?                                                                                                                        | No                      |
      | Are accessible alternatives provided for background images that convey information or meaning?                                                               | Yes (or not applicable) |
      | Does all link and navigation text uniquely describe the target or function of the link or item?                                                              | Yes                     |
      | Do all links to alternative formats indicate that an alternative is opening?                                                                                 | Yes (or not applicable) |
      | Are repeated links to the same resource combined within a single link?                                                                                       | Yes (or not applicable) |
      | Are notifications both visible and audible?                                                                                                                  | Yes (or not applicable) |
      | Are standard operating system notifications used where available and appropriate?                                                                            | Yes (or not applicable) |
      | Are clear error messages provided?                                                                                                                           | Yes (or not applicable) |
      | Is non-critical feedback or assistance provided when appropriate?                                                                                            | Yes (or not applicable) |
      | Are scripts and dynamic content built in a progressive manner?                                                                                               | Yes (or not applicable) |
      | Does all media that updates or animated content have a pause, stop or hide control?                                                                          | Yes (or not applicable) |
      | Does the page refresh automatically without warning?                                                                                                         | No                      |
      | Are there any timed responses that are not adjustable?                                                                                                       | No                      |
      | Is interaction input control adaptable?                                                                                                                      | Yes (or not applicable) |
      | Is the page title uniquely and clearly identifiable?                                                                                                         | Yes                     |
      | Are containers used to describe page structure?                                                                                                              | Yes                     |
      | Are controls, objects and grouped interface elements represented as a single accessible component?                                                           | Yes                     |
      | Do alternatives briefly describe the editorial intent or purpose of the image, object, or element?                                                           | Yes (or not applicable) |
      | Are decorative images hidden from assistive technology?                                                                                                      | Yes (or not applicable) |
      | Do tooltips repeat link text or other alternatives?                                                                                                          | No (or not applicable)  |
      | Do elements have accessibility properties set appropriately?                                                                                                 | Yes (or not applicable) |
      | Is visual formatting alone used to convey meaning?                                                                                                           | No                      |
    Then it should result in a pass for http://localhost:54321/perfect.html

  Scenario: Failing manual tests
    Given a website running at http://localhost:54321
    When I run `bbc-a11y http://localhost:54321/perfect.html --manual`
    And I answer all questions except one with a pass
    Then it should result in a fail for http://localhost:54321/perfect.html

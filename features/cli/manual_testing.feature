Feature: Manual Testing

  Scenario: Running manual tests
    Given a website running at http://localhost:54321
    When I run `bbc-a11y http://localhost:54321/perfect.html --manual`
    And I answer the following questions:
      | question                                                                                                                                                            | answer                  |
      | Is alternative delivery (such as subtitles, sign language, audio description or transcripts) provided with all embedded media?                                      | Yes (or not applicable) |
      | Does any audio that plays automatically make the user aware this will happen, or provide a pause/stop/mute button?                                                  | Yes (or not applicable) |
      | Is relevant metadata provided for all media?                                                                                                                        | Yes (or not applicable) |
      | Are suitable volume controls provided for different audio layers in all interactive media?                                                                          | Yes (or not applicable) |
      | Does narrative audio in any interactive media conflict with native assistive technology?                                                                            | No (or not applicable)  |
      | Do all text and background colour combinations pass a reliable colour contrast check?                                                                               | Yes                     |
      | Is all information conveyed by colour also conveyed by other means, such as additional style, context or markup?                                                    | Yes (or not applicable) |
      | Is the core content of the page readable and usable without styling/CSS?                                                                                            | Yes                     |
      | Are all touch targets large enough for accurate interaction (larger than 7mm x 7mm)?                                                                                | Yes                     |
      | Is an inactive space provided around every actionable element?                                                                                                      | Yes (or not applicable) |
      | Does the content scale when zoom or pinch-zoom is used?                                                                                                             | Yes                     |
      | Is the content visible and usable with the text resized to 200% or 50% of default?                                                                                  | Yes                     |
      | Are all links, buttons and other actionable elements in the content self-evident, identifiable by their visual style, and distinguishable from surrounding content? | Yes                     |
      | Do all actionable and focusable elements visibly change state when focused?                                                                                         | Yes                     |
      | Is the user experience consistent across pages and screens, eg. layout, labels, focus states etc.?                                                                  | Yes                     |
      | Does the interface provide multiple ways to interact with the content?                                                                                              | Yes                     |
      | Can all interactive media be suitably adjusted for different user abilities and preferences?                                                                        | Yes (or not applicable) |
      | Does any content visibly or intentionally flicker or flash more than three times in any one-second period?                                                          | No (or not applicable)  |
      | Are consistent editorial labels used?                                                                                                                               | Yes (or not applicable) |
      | Are any changes to the defined language of the page indicated programmatically?                                                                                     | Yes (or not applicable) |
      | Are suitable additional instructions provided to supplement visual and audio cues?                                                                                  | Yes (or not applicable) |
      | Are all (and only) interactive elements focusable?                                                                                                                  | Yes                     |
      | Is anything a keyboard trap?                                                                                                                                        | No                      |
      | Is content logically ordered?                                                                                                                                       | Yes                     |
      | Is actionable content navigable in a meaningful sequence?                                                                                                           | Yes                     |
      | Are actions triggered when appropriate for the type of user interaction?                                                                                            | Yes                     |
      | Are alternative input methods, such as keyboard or voice, supported?                                                                                                | Yes                     |
      | Is a default input format indicated/implied and supported?                                                                                                          | Yes (or not applicable) |
      | Are labels placed close to the relevant form control, and laid out appropriately?                                                                                   | Yes (or not applicable) |
      | Are controls, labels, and other form elements properly grouped?                                                                                                     | Yes (or not applicable) |
      | Does focus or context automatically change during user input?                                                                                                       | No (or not applicable)  |
      | Are there any unnecessary images of text?                                                                                                                           | No                      |
      | Are accessible alternatives provided for element background images that convey information or meaning?                                                              | Yes (or not applicable) |
      | Does each link and navigation text uniquely describe the target or function of the link or item?                                                                    | Yes                     |
      | Do all links to alternative formats indicate that an alternative is opening?                                                                                        | Yes (or not applicable) |
      | Are neighbouring elements linking to the same resource combined within a single link?                                                                               | Yes (or not applicable) |
      | Are notifications both visible and audible (via assistive technology if needed)?                                                                                    | Yes (or not applicable) |
      | Are standard operating system notifications used where available and appropriate?                                                                                   | Yes (or not applicable) |
      | Are clear accessible error messages provided when needed?                                                                                                           | Yes (or not applicable) |
      | Is non-critical feedback or assistance provided in an accessible way when appropriate?                                                                              | Yes (or not applicable) |
      | Are scripts and dynamic content added in a progressive manner?                                                                                                      | Yes (or not applicable) |
      | Does all media that updates or is animated content have a pause, stop or hide control?                                                                              | Yes (or not applicable) |
      | Does the page refresh automatically without warning?                                                                                                                | No                      |
      | Are there any timed responses that cannot be adjusted?                                                                                                              | No                      |
      | Is interaction input control adaptable?                                                                                                                             | Yes (or not applicable) |
      | Is the page title uniquely and clearly identifiable?                                                                                                                | Yes                     |
      | Are suitable containers used to help describe page structure?                                                                                                       | Yes                     |
      | Are controls, objects and grouped interface elements represented as a single accessible component?                                                                  | Yes (or not applicable) |
      | Do text alternatives briefly describe the editorial intent or purpose of each content image, object, or element?                                                    | Yes (or not applicable) |
      | Are decorative images hidden from assistive technology?                                                                                                             | Yes (or not applicable) |
      | Do tooltips repeat link text or other alternatives?                                                                                                                 | No (or not applicable)  |
      | Do elements have accessibility properties set appropriately?                                                                                                        | Yes (or not applicable) |
      | Is visual formatting alone used to convey meaning?                                                                                                                  | No                      |
    Then it should result in a pass for http://localhost:54321/perfect.html

  Scenario: Failing manual tests
    Given a website running at http://localhost:54321
    When I run `bbc-a11y http://localhost:54321/perfect.html --manual`
    And I answer all questions except one with a pass
    Then it should result in a fail for http://localhost:54321/perfect.html

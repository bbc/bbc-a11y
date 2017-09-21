Feature: Resizable text

  * Text must be styled with units that are resizable in all browsers.

  * Content must be visible and usable with text resized to 200% of normal.

  * Content must be visible and usable with page zoomed to 200% of normal.

  * Where available on a platform zoom must be suported.

  Rationale
  =========

  Standard browser features for resizing text or page zoom can make content
  accessible to many low vision users without the need for additional assistive
  technologies such as screen magnifiers or screen readers.

  Text resizing and page zoom cater to different needs, and therefore both
  should be supported.

  Internet Explorer does not resize text that have been styled in px units,
  therefore em, % or similar units should be used.

  Browsers on iOS, Android, and other mobile platforms also support zoom with
  pinch-in and pinch-out gestures. In most cases it is just a matter of not
  disabling this, but there are some cases when it is appropriate to implement
  content specific interactions, such as with zoomable maps, which should mimic
  the same pinch-in and pinch-out gestures.

  Scenario: Text must be styled with units that are resizable in all browsers
    Given a page with the body:
      """
      <p style="font-size: 16px">Styled in px!</p>
      <style>b { font-size: 18px }</style>
      <b>Styled in px!</b>
      """
    When I test the "Resizable text: Text must be styled with units that are resizable in all browsers" standard
    Then it fails with the message:
      """
      Text styled with px unit: /html/body/p
      Text styled with px unit: /html/body/b
      """

  Scenario: User agent stylesheet is ignored
    Given a page with the body:
      """
      <p>Not styled in px!</p>
      """
    When I test the "Resizable text: Text must be styled with units that are resizable in all browsers" standard
    Then it passes

Feature: Alternatives for non-text content

  Alternatives must briefly describe the editorial intent or purpose of the
  image, object, or element.

  People using screen readers are often vision impaired and unable to perceive
  non-text content. Providing a brief alternative that the screen reader speaks
  conveys the same editorial intent or purpose of editorially significant
  non-text content, such as buttons, icons, images, or avatars.

  When alternatives are provided for actionable items such as buttons, or image
  links, the alternative should describe the action that will be performed. For
  example, a button with a triangle icon is often used to play content and the
  alternative would be "Play ...".

  If there are several similar items on the same page/screen, each should have a
  unique alternative to distinguish them from each other. For example, rather
  than multiple 'share' buttons with the same alternative "Share", the
  alternative should be "Share ..." and include the name of the related item.

  Verbose alternatives make content harder to listen to and understand for
  screen reader users. Endeavour to be succinct, and avoid redundant phrasing
  such as "Picture of ...", "... logo", or "Select this to ...".

  The element type or trait, such as image or button, does not need to be
  included in the alternative as it is programmatically determined and added by
  the screen reader. For example, a 'play' button coded as a button with the
  alternative "Play button" would be spoken as "Play button. Button.". An image
  coded as an image with an alternative beginning "Image of ..." would be
  spoken as "Image. Image of ...".

  Background:
    Given I am performing a manual test of the "Text equivalents: Alternatives for non-text content: Alternatives must briefly describe editorial intent" standard
    And I have been asked "Do alternatives briefly describe the editorial intent or purpose of the image, object, or element?"

  Scenario: Alternatives briefly describe the editorial intent or purpose of images, objects, or elements (manual pass)
    When I answer "Yes (or not applicable)"
    Then the manual test passes

  Scenario: Alternatives do not briefly describe the editorial intent or purpose of images, objects, or elements (manual fail)
    When I answer "No"
    Then the manual test fails

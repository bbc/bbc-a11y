Feature: Summarise Tests

  Scenario: Printing a summary of tests
    When I run `bbc-a11y --coverage list`
    And it should pass with:
      """
      Tests covered by bbc-a11y:

      Principles: All documents must have a W3C recommended doctype
      Type: automated
      Fails for each page that is missing a w3c recommended doctype (e.g. <!DOCTYPE html>)

      Principles: Markup must validate against doctype
      Type: automated
      Fails for each page whose markup does not validate against a w3c standards validator

      Principles: Anchors must have hrefs
      Type: automated
      Fails for each visible <a> element with no href attribute

      Audio & Video: Alternatives for audio and visual content: Alternative delivery for embedded media must be provided
      Type: manual
      Fails for each page that includes embedded media with no alternative delivery

      Audio & Video: Autoplay: Audio must not play automatically without controls
      Type: manual
      Fails for each audio that plays back without the user being aware or pause/stop/mute button provided

      Audio & Video: Metadata: Relevant metadata should be provided for all media
      Type: manual
      Fails for each page with media that is missing relevant metadata

      Audio & Video: Volume control: Volume controls should be provided for interactive media
      Type: manual
      Fails for each page that provides no volume controls for interactive media

      Audio & Video: Audio conflict: Narrative audio should not conflict with assistive technology
      Type: manual
      Fails for each page with narrative audio that conflicts with assistive technology

      Design: Colour contrast: Colour combinations must pass the WCAG colour contrast check
      Type: manual
      Fails for each page whose colour combinations fail the WCAG colour contrast check

      Design: Colour and meaning: Information conveyed with colour must also be identifiable from context or markup
      Type: manual
      Fails for each page whose information conveyed with colour is not also identifiable from context or markup

      Design: Styling and readability: Core content must be accessible when styling is removed
      Type: manual
      Fails for each page that requires styling to be accessible

      Design: Touch target size: Touch targets must be large enough to touch accurately
      Type: manual
      Fails for each page that includes touch targets that are too small to touch accurately

      Design: Spacing: An inactive space should be provided around actionable elements
      Type: manual
      Fails for each page that includes actionable elements with no inactive space around them

      Design: Content resizing: Content must be visible and usable with page zoomed to 200% of normal
      Type: manual
      Fails for each page whose content is not visible or is not usable when zoomed to 200% of normal

      Design: Content resizing: Content must be visible and usable with text resized to 200% of normal
      Type: manual
      Fails for each page whose content is not visible or is not usable when text is resized to 200% of normal

      Design: Content resizing: Text must be styled with units that are resizable in all browsers
      Type: automated
      Fails for each text node that descends from an element styled with a px unit

      Design: Content resizing: Text cannot be too small
      Type: automated
      Fails for each text node with a computed font size of less than 11px

      Design: Actionable elements: Editorial links must be self-evident
      Type: manual
      Fails for each <a> that is part of general editorial content, that is not identifiable by its visual style, and distinguishable from the surrounding content

      Design: Visible focus: Focused elements must visibly change state
      Type: manual
      Fails for each page with actionable and focusable elements that do not have a visible state change

      Design: Visible focus: Elements must be visible on focus
      Type: automated
      Fails for each <a> element that is hidden after receiving focus

      Design: Consistency: User experience should be consistent
      Type: manual
      Fails for each page that provides inconsitent user experience

      Design: Choice: Interfaces must provide multiple ways to interact with content
      Type: manual
      Fails for each page with interface elements that only provide one way to interact

      Design: Adjustability: Interactive media should be adjustable for user ability and preference
      Type: manual
      Fails for each page with interactive media that is not adjustable for user ability and preference

      Design: Flicker: Content must not flicker or flash
      Type: manual
      Fails for each page with flickering or flashing content

      Editorial: Consistent labelling: Consistent labelling should be used
      Type: manual
      Fails for each page with inconsistent labelling

      Editorial: Indicating language: Html must have lang attribute
      Type: automated
      Fails for each <html> element with no lang attribute

      Editorial: Indicating language: Changes to language must be indicated
      Type: manual
      Fails for each page that changes language with no indication

      Editorial: Instructions: Additional instructions should be provided
      Type: manual
      Fails for each page that is missing a w3c recommended doctype (e.g. <!DOCTYPE html>)

      Focus: Focusable elements: Interactive elements must be focusable
      Type: manual
      Fails for each page with interactive elements that are not focusable

      Focus: Focusable elements: Zero tab index must only be set on elements which are focusable by default
      Type: automated
      Fails for each element that is not focusable by default (input, button, select, textarea, a) and has a tabindex attribute set to 0

      Focus: Keyboard trap: There must not be a keyboard trap
      Type: manual
      Fails for each page that has a keyboard trap

      Focus: Content order: Content order must be logical
      Type: manual
      Fails for each page with illogical content order

      Focus: Focus order: Actionable content must be navigable in a meaningful sequence
      Type: manual
      Fails for each page that is not navigable in a meaningful sequence

      Focus: Changing focus: Focus or context must not automatically change during user input
      Type: manual
      Fails for each page with focus or context that changes automatically during user input

      Focus: Changing focus: Forms must have submit buttons
      Type: automated
      Fails for each visible <form> element that has no submit button (can be any of input[type=submit], button[type=submit], input[type=image])

      Focus: Appropriate triggers: Actions must be triggered when appropriate
      Type: manual
      Fails for each page without actions triggered when appropriate for the type of user interaction

      Focus: Alternative input methods: Alternative input methods must be supported
      Type: manual
      Fails for each page with navigable content that does not support alternative input methods

      Forms: Labelling form controls: Fields must have labels or titles
      Type: automated
      Fails for each visible input element (<input>, <textarea> and <select>) with no title attribute or <label> element referring to it (in the label's for attribute)
      Fails for each <button> element with no text (or only whitespace as text)

      Forms: Input format: A default input format must be indicated and supported
      Type: manual
      Fails for each page where a default input format is not indicated or supported

      Forms: Form layout: Labels must be close and laid out appropriately
      Type: manual
      Fails for each page with labels that are not close to the relevant form control, or laid out inappropriately

      Forms: Grouping form elements: Controls, labels, and other form elements must be properly grouped
      Type: manual
      Fails for each page with controls, labels, or other form elements that are improperly grouped

      Images: Images of text: Images of text should be avoided
      Type: manual
      Fails for each page with unnecessary images of text

      Images: Background images: Meaningful background images must have accessible alternatives
      Type: manual
      Fails for each page without accessible alternatives provided for background images that convey information or meaning

      Links: Descriptive links: Link and navigation text must uniquely describe the target or function
      Type: manual
      Fails for each page with links or navigation text that does not uniquely describe the target or function of the link or item

      Links: Links to alternative formats: Links to alternative formats must indicate that an alternative is opening
      Type: manual
      Fails for each page with links to alternative formats that do not indicate that an alternative is opening

      Links: Combining repeated links: Repeated links to the same resource must be combined
      Type: manual
      Fails for each page with repeated links to the same resource

      Notifications: Inclusive notifications: Notifications must be both visible and audible
      Type: manual
      Fails for each page with notifications that are only visible or audible, but not both

      Notifications: Standard operating system notifications: Prefer standard operating system notifications
      Type: manual
      Fails for each page with non-standard notifications used where standard operating system notifications are appropriate

      Notifications: Error messages and correction: Clear error messages must be provided
      Type: manual
      Fails for each page that provides unclear error messages

      Notifications: Feedback and assistance: Non-critical feedback or assistance should be provided when appropriate
      Type: manual
      Fails for each page with appropriate non-critical feedback or assistance not provided

      Scripts and dynamic content: Progressive functionality: Scripts and dynamic content must be built in a progressive manner
      Type: manual
      Fails for each page with scripts and dynamic content that is not built in a progressive manner

      Scripts and dynamic content: Controlling media: Media that updates and animation must have a pause, stop or hide control
      Type: manual
      Fails for each page with media that updates or animation that has no pause, stop or hide control

      Scripts and dynamic content: Page refreshes: Automatic page refreshes must not be used without warning
      Type: manual
      Fails for each page that refreshes automatically without warning

      Scripts and dynamic content: Timeouts: Timed responses must be adjustable
      Type: manual
      Fails for each page with timed responses that are not adjustable

      Scripts and dynamic content: Input control: Interaction input control should be adaptable
      Type: manual
      Fails for each page whose interaction input control is not adaptable

      Structure: Unique page/screen titles: Page titles must be uniquely and clearly identifiable
      Type: manual
      Fails for each page title that is not uniquely and clearly identifiable

      Structure: Unique page/screen titles: Title element must identify main content
      Type: semi-automated
      Fails for each <title> element that does not match a pre-configured pattern or function

      Structure: Headings: Headings must be in ascending order
      Type: automated
      Fails for each visible heading (<h2> to <h8>) that does follow the next highest-level heading. For example, a <h3> can only come after a <h2>

      Structure: Headings: Exactly one main heading
      Type: automated
      Fails for each visible <h1> element except the very first one

      Structure: Headings: Content must follow headings
      Type: automated
      Fails for each heading element (<h1> up to <h8>) that has no text content after it. Text elements may appear as children or descendants of subsequent siblings

      Structure: Containers and landmarks: Containers should be used to describe page structure
      Type: manual
      Fails for each page that does not use containers to describe page structure

      Structure: Containers and landmarks: Exactly one main landmark
      Type: automated
      Fails for each page with no landmark element (any element with role="main")

      Structure: Grouped elements: Grouped interface elements must be represented as a single component
      Type: manual
      Fails for each page with controls, objects and grouped interface elements not represented as a single accessible component

      Text equivalents: Alternatives for non-text content: Alternatives must briefly describe editorial intent
      Type: manual
      Fails for each page where alternatives do not briefly describe the editorial intent or purpose of images, objects, or elements

      Text equivalents: Alternatives for non-text content: Images must have alt attributes
      Type: automated
      Fails for each visible <img> element that has no alt attribute

      Text equivalents: Decorative content: Decorative images must be hidden from assistive technology
      Type: manual
      Fails for each page where decorative images are not hidden from assistive technology

      Text equivalents: Tooltips and supplementary information: Tooltips must not repeat link text or other alternatives
      Type: manual
      Fails for each page where tooltips repeat link text or other alternatives

      Text equivalents: Tooltips and supplementary information: Title attributes only on inputs
      Type: automated
      Fails for each element that is not an input (input, button, textarea, select) or iframe, but does have a title attribute

      Text equivalents: Tooltips and supplementary information: Title attributes must not duplicate content
      Type: automated
      Fails for each element that has the same text content as the page <title>

      Text equivalents: Roles, traits and properties: Elements must have accessibility properties set appropriately
      Type: manual
      Fails for each page where elements do not have accessibility properties set appropriately

      Text equivalents: Visual formatting: Visual formatting alone must not be used to convey meaning
      Type: manual
      Fails for each page where visual formatting alone is used to convey meaning

      Text equivalents: Visual formatting: Use tables for data
      Type: automated
      Fails for each <table> that is used to apply layout, rather than to display data
      """

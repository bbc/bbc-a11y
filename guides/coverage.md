# BBC A11y Test Coverage

bbc-a11y tests URLs against the
[BBC Mobile Accessibility Guidelines](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile). This is
a summary of those guidelines and the level of test coverage currently provided.

## Guidelines
| Guideline                                                                                                                                                                              | Manual | Semi-automated | Automated |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------ | -------------- | --------- |
| [Principles](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/principles)                                                                                              | No     | No             | Yes       |
| [Audio & Video: Alternatives for audio and visual content](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/audio-and-video/alternatives-for-audio-and-visual-content) | Yes    | No             | No        |
| [Audio & Video: Autoplay](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/audio-and-video/autoplay)                                                                   | Yes    | No             | No        |
| [Audio & Video: Metadata](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/audio-and-video/metadata)                                                                   | Yes    | No             | No        |
| [Audio & Video: Volume control](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/audio-and-video/volume-control)                                                       | Yes    | No             | No        |
| [Audio & Video: Audio conflict](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/audio-and-video/audio-conflict)                                                       | Yes    | No             | No        |
| [Design: Colour contrast](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/colour-contrast)                                                                     | Yes    | No             | No        |
| [Design: Colour and meaning](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/colour-and-meaning)                                                               | Yes    | No             | No        |
| [Design: Styling and readability](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/styling-and-readability)                                                     | Yes    | No             | No        |
| [Design: Touch target size](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/touch-target-size)                                                                 | Yes    | No             | No        |
| [Design: Spacing](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/spacing)                                                                                     | Yes    | No             | No        |
| [Design: Content resizing](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/content-resizing)                                                                   | Yes    | No             | Yes       |
| [Design: Actionable elements](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/actionable-elements)                                                             | Yes    | No             | No        |
| [Design: Visible focus](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/visible-focus)                                                                         | Yes    | No             | Yes       |
| [Design: Consistency](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/consistency)                                                                             | Yes    | No             | No        |
| [Design: Choice](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/choice)                                                                                       | Yes    | No             | No        |
| [Design: Adjustability](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/adjustability)                                                                         | Yes    | No             | No        |
| [Design: Flicker](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/flicker)                                                                                     | Yes    | No             | No        |
| [Editorial: Consistent labelling](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/editorial/consistent-labelling)                                                     | Yes    | No             | No        |
| [Editorial: Indicating language](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/editorial/indicating-language)                                                       | Yes    | No             | Yes       |
| [Editorial: Instructions](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/editorial/instructions)                                                                     | Yes    | No             | No        |
| [Focus: Focusable elements](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/focus/focusable-elements)                                                                 | Yes    | No             | Yes       |
| [Focus: Keyboard trap](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/focus/keyboard-trap)                                                                           | Yes    | No             | No        |
| [Focus: Content order](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/focus/content-order)                                                                           | Yes    | No             | No        |
| [Focus: Focus order](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/focus/focus-order)                                                                               | Yes    | No             | No        |
| [Focus: User interactions](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/focus/user-interactions)                                                                   | Yes    | No             | No        |
| [Focus: Alternative input methods](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/focus/alternative-input-methods)                                                   | Yes    | No             | No        |
| [Forms: Labelling form controls](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/forms/labelling-form-controls)                                                       | No     | No             | Yes       |
| [Forms: Form inputs](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/forms/form-inputs)                                                                               | Yes    | No             | No        |
| [Forms: Form layout](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/forms/form-layout)                                                                               | Yes    | No             | No        |
| [Forms: Grouping form elements](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/forms/grouping-form-elements)                                                         | Yes    | No             | No        |
| [Forms: Managing focus](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/forms/managing-focus)                                                                         | Yes    | No             | Yes       |
| [Images: Images of text](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/images/images-of-text)                                                                       | Yes    | No             | No        |
| [Images: Background images](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/images/background-images)                                                                 | Yes    | No             | No        |
| [Links: Descriptive links](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/links/descriptive-links)                                                                   | Yes    | No             | No        |
| [Links: Links to alternative formats](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/links/links-to-alternative-formats)                                             | Yes    | No             | No        |
| [Links: Combining repeated links](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/links/combining-repeated-links)                                                     | Yes    | No             | No        |
| [Notifications: Inclusive notifications](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/notifications/inclusive-notifications)                                       | Yes    | No             | No        |
| [Notifications: Standard operating system notifications](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/notifications/standard-operating-system-notifications)       | Yes    | No             | No        |
| [Notifications: Error messages and correction](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/notifications/error-messages-and-correction)                           | Yes    | No             | No        |
| [Notifications: Feedback and assistance](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/notifications/feedback-and-assistance)                                       | Yes    | No             | No        |
| [Scripts and dynamic content: Progressive functionality](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/scripts-and-dynamic-content/progressive-functionality)       | Yes    | No             | No        |
| [Scripts and dynamic content: Controlling media](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/scripts-and-dynamic-content/controlling-media)                       | Yes    | No             | No        |
| [Scripts and dynamic content: Page refreshes](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/scripts-and-dynamic-content/page-refreshes)                             | Yes    | No             | No        |
| [Scripts and dynamic content: Timeouts](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/scripts-and-dynamic-content/timeouts)                                         | Yes    | No             | No        |
| [Scripts and dynamic content: Input control](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/scripts-and-dynamic-content/input-control)                               | Yes    | No             | No        |
| [Structure: Unique page/screen titles](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/structure/unique-pagescreen-titles)                                            | Yes    | Yes            | No        |
| [Structure: Headings](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/structure/headings)                                                                             | No     | No             | Yes       |
| [Structure: Containers and landmarks](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/structure/containers-and-landmarks)                                             | Yes    | No             | Yes       |
| [Structure: Grouped elements](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/structure/grouped-elements)                                                             | Yes    | No             | No        |
| [Text equivalents: Alternatives for non-text content](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/text-equivalents/alternatives-for-non-text-content)             | Yes    | No             | Yes       |
| [Text equivalents: Decorative content](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/text-equivalents/decorative-content)                                           | Yes    | No             | No        |
| [Text equivalents: Tooltips and supplementary information](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/text-equivalents/tooltips-and-supplementary-information)   | Yes    | No             | Yes       |
| [Text equivalents: Roles, traits and properties](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/text-equivalents/roles-traits-and-properties)                        | Yes    | No             | No        |
| [Text equivalents: Visual formatting](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/text-equivalents/visual-formatting)                                             | Yes    | No             | Yes       |

## Tests


### Principles

| Test Name                                         | Test Type |
| ------------------------------------------------- | --------- |
| All documents must have a W3C recommended doctype | automated |
| Markup must validate against doctype              | automated |
| Anchors must have hrefs                           | automated |


### Audio & Video: Alternatives for audio and visual content

| Test Name                                                | Test Type |
| -------------------------------------------------------- | --------- |
| Alternative delivery for embedded media must be provided | manual    |


### Audio & Video: Autoplay

| Test Name                                          | Test Type |
| -------------------------------------------------- | --------- |
| Audio must not play automatically without controls | manual    |


### Audio & Video: Metadata

| Test Name                                          | Test Type |
| -------------------------------------------------- | --------- |
| Relevant metadata should be provided for all media | manual    |


### Audio & Video: Volume control

| Test Name                                                | Test Type |
| -------------------------------------------------------- | --------- |
| Volume controls should be provided for interactive media | manual    |


### Audio & Video: Audio conflict

| Test Name                                                     | Test Type |
| ------------------------------------------------------------- | --------- |
| Narrative audio should not conflict with assistive technology | manual    |


### Design: Colour contrast

| Test Name                                                    | Test Type |
| ------------------------------------------------------------ | --------- |
| Colour combinations must pass the WCAG colour contrast check | manual    |


### Design: Colour and meaning

| Test Name                                                                         | Test Type |
| --------------------------------------------------------------------------------- | --------- |
| Information conveyed with colour must also be identifiable from context or markup | manual    |


### Design: Styling and readability

| Test Name                                               | Test Type |
| ------------------------------------------------------- | --------- |
| Core content must be accessible when styling is removed | manual    |


### Design: Touch target size

| Test Name                                              | Test Type |
| ------------------------------------------------------ | --------- |
| Touch targets must be large enough to touch accurately | manual    |


### Design: Spacing

| Test Name                                                       | Test Type |
| --------------------------------------------------------------- | --------- |
| An inactive space should be provided around actionable elements | manual    |


### Design: Content resizing

| Test Name                                                              | Test Type |
| ---------------------------------------------------------------------- | --------- |
| Content must be visible and usable with page zoomed to 200% of normal  | manual    |
| Content must be visible and usable with text resized to 200% of normal | manual    |
| Text must be styled with units that are resizable in all browsers      | automated |
| Text cannot be too small                                               | automated |


### Design: Actionable elements

| Test Name                            | Test Type |
| ------------------------------------ | --------- |
| Editorial links must be self-evident | manual    |


### Design: Visible focus

| Test Name                                  | Test Type |
| ------------------------------------------ | --------- |
| Focused elements must visibly change state | manual    |
| Elements must be visible on focus          | automated |


### Design: Consistency

| Test Name                            | Test Type |
| ------------------------------------ | --------- |
| User experience should be consistent | manual    |


### Design: Choice

| Test Name                                                      | Test Type |
| -------------------------------------------------------------- | --------- |
| Interfaces must provide multiple ways to interact with content | manual    |


### Design: Adjustability

| Test Name                                                              | Test Type |
| ---------------------------------------------------------------------- | --------- |
| Interactive media should be adjustable for user ability and preference | manual    |


### Design: Flicker

| Test Name                         | Test Type |
| --------------------------------- | --------- |
| Content must not flicker or flash | manual    |


### Editorial: Consistent labelling

| Test Name                           | Test Type |
| ----------------------------------- | --------- |
| Consistent labelling should be used | manual    |


### Editorial: Indicating language

| Test Name                             | Test Type |
| ------------------------------------- | --------- |
| Html must have lang attribute         | automated |
| Changes to language must be indicated | manual    |


### Editorial: Instructions

| Test Name                                  | Test Type |
| ------------------------------------------ | --------- |
| Additional instructions should be provided | manual    |


### Focus: Focusable elements

| Test Name                                                                  | Test Type |
| -------------------------------------------------------------------------- | --------- |
| Interactive elements must be focusable                                     | manual    |
| Zero tab index must only be set on elements which are focusable by default | automated |


### Focus: Keyboard trap

| Test Name                         | Test Type |
| --------------------------------- | --------- |
| There must not be a keyboard trap | manual    |


### Focus: Content order

| Test Name                     | Test Type |
| ----------------------------- | --------- |
| Content order must be logical | manual    |


### Focus: Focus order

| Test Name                                                     | Test Type |
| ------------------------------------------------------------- | --------- |
| Actionable content must be navigable in a meaningful sequence | manual    |


### Focus: User interactions

| Test Name                                  | Test Type |
| ------------------------------------------ | --------- |
| Actions must be triggered when appropriate | manual    |


### Focus: Alternative input methods

| Test Name                                   | Test Type |
| ------------------------------------------- | --------- |
| Alternative input methods must be supported | manual    |


### Forms: Labelling form controls

| Test Name                         | Test Type |
| --------------------------------- | --------- |
| Fields must have labels or titles | automated |


### Forms: Form inputs

| Test Name                                              | Test Type |
| ------------------------------------------------------ | --------- |
| A default input format must be indicated and supported | manual    |


### Forms: Form layout

| Test Name                                       | Test Type |
| ----------------------------------------------- | --------- |
| Labels must be close and laid out appropriately | manual    |


### Forms: Grouping form elements

| Test Name                                                          | Test Type |
| ------------------------------------------------------------------ | --------- |
| Controls, labels, and other form elements must be properly grouped | manual    |


### Forms: Managing focus

| Test Name                                                        | Test Type |
| ---------------------------------------------------------------- | --------- |
| Focus or context must not automatically change during user input | manual    |
| Forms must have submit buttons                                   | automated |


### Images: Images of text

| Test Name                        | Test Type |
| -------------------------------- | --------- |
| Images of text should be avoided | manual    |


### Images: Background images

| Test Name                                                      | Test Type |
| -------------------------------------------------------------- | --------- |
| Meaningful background images must have accessible alternatives | manual    |


### Links: Descriptive links

| Test Name                                                              | Test Type |
| ---------------------------------------------------------------------- | --------- |
| Link and navigation text must uniquely describe the target or function | manual    |


### Links: Links to alternative formats

| Test Name                                                                 | Test Type |
| ------------------------------------------------------------------------- | --------- |
| Links to alternative formats must indicate that an alternative is opening | manual    |


### Links: Combining repeated links

| Test Name                                            | Test Type |
| ---------------------------------------------------- | --------- |
| Repeated links to the same resource must be combined | manual    |


### Notifications: Inclusive notifications

| Test Name                                      | Test Type |
| ---------------------------------------------- | --------- |
| Notifications must be both visible and audible | manual    |


### Notifications: Standard operating system notifications

| Test Name                                      | Test Type |
| ---------------------------------------------- | --------- |
| Prefer standard operating system notifications | manual    |


### Notifications: Error messages and correction

| Test Name                             | Test Type |
| ------------------------------------- | --------- |
| Clear error messages must be provided | manual    |


### Notifications: Feedback and assistance

| Test Name                                                               | Test Type |
| ----------------------------------------------------------------------- | --------- |
| Non-critical feedback or assistance should be provided when appropriate | manual    |


### Scripts and dynamic content: Progressive functionality

| Test Name                                                         | Test Type |
| ----------------------------------------------------------------- | --------- |
| Scripts and dynamic content must be built in a progressive manner | manual    |


### Scripts and dynamic content: Controlling media

| Test Name                                                                | Test Type |
| ------------------------------------------------------------------------ | --------- |
| Media that updates and animation must have a pause, stop or hide control | manual    |


### Scripts and dynamic content: Page refreshes

| Test Name                                                 | Test Type |
| --------------------------------------------------------- | --------- |
| Automatic page refreshes must not be used without warning | manual    |


### Scripts and dynamic content: Timeouts

| Test Name                          | Test Type |
| ---------------------------------- | --------- |
| Timed responses must be adjustable | manual    |


### Scripts and dynamic content: Input control

| Test Name                                     | Test Type |
| --------------------------------------------- | --------- |
| Interaction input control should be adaptable | manual    |


### Structure: Unique page/screen titles

| Test Name                                             | Test Type      |
| ----------------------------------------------------- | -------------- |
| Page titles must be uniquely and clearly identifiable | manual         |
| Title element must identify main content              | semi-automated |


### Structure: Headings

| Test Name                           | Test Type |
| ----------------------------------- | --------- |
| Headings must be in ascending order | automated |
| Exactly one main heading            | automated |
| Content must follow headings        | automated |


### Structure: Containers and landmarks

| Test Name                                            | Test Type |
| ---------------------------------------------------- | --------- |
| Containers should be used to describe page structure | manual    |
| Exactly one main landmark                            | automated |


### Structure: Grouped elements

| Test Name                                                            | Test Type |
| -------------------------------------------------------------------- | --------- |
| Grouped interface elements must be represented as a single component | manual    |


### Text equivalents: Alternatives for non-text content

| Test Name                                           | Test Type |
| --------------------------------------------------- | --------- |
| Alternatives must briefly describe editorial intent | manual    |
| Images must have alt attributes                     | automated |


### Text equivalents: Decorative content

| Test Name                                                  | Test Type |
| ---------------------------------------------------------- | --------- |
| Decorative images must be hidden from assistive technology | manual    |


### Text equivalents: Tooltips and supplementary information

| Test Name                                                | Test Type |
| -------------------------------------------------------- | --------- |
| Tooltips must not repeat link text or other alternatives | manual    |
| Title attributes only on inputs                          | automated |
| Title attributes must not duplicate content              | automated |


### Text equivalents: Roles, traits and properties

| Test Name                                                     | Test Type |
| ------------------------------------------------------------- | --------- |
| Elements must have accessibility properties set appropriately | manual    |


### Text equivalents: Visual formatting

| Test Name                                                  | Test Type |
| ---------------------------------------------------------- | --------- |
| Visual formatting alone must not be used to convey meaning | manual    |
| Use tables for data                                        | automated |


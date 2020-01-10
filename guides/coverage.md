# BBC A11y Test Coverage

bbc-a11y tests URLs against the
[BBC Mobile Accessibility Guidelines](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/). This is
a summary of those guidelines and the level of test coverage currently provided.

## Guidelines
| Guideline                                                                                                                                                                              | Manual | Semi-automated | Automated |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------ | -------------- | --------- |
| [Principles](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/principles)                                                                                                  | No     | No             | Yes       |
| [Audio & Video: Alternatives for audio and visual content](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/alternatives-for-audio-and-visual-content)                    | Yes    | No             | No        |
| [Audio & Video: Autoplay](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/autoplay)                                                                                      | Yes    | No             | No        |
| [Audio & Video: Metadata](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/metadata)                                                                                      | Yes    | No             | No        |
| [Audio & Video: Volume control](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/volume-control)                                                                          | Yes    | No             | No        |
| [Audio & Video: Audio conflict](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/audio-conflict)                                                                          | Yes    | No             | No        |
| [Design: Colour contrast](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/colour-contrast)                                                                                | Yes    | No             | No        |
| [Design: Colour and meaning](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/colour-and-meaning)                                                                          | Yes    | No             | No        |
| [Design: Styling and readability](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/styling-and-readability)                                                                | Yes    | No             | No        |
| [Design: Touch target size](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/target-touch-size)                                                                            | Yes    | No             | No        |
| [Design: Spacing](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/spacing)                                                                                                | Yes    | No             | No        |
| [Design: Content resizing](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/content-resizing)                                                                              | Yes    | No             | Yes       |
| [Design: Actionable elements](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/actionable-elements)                                                                        | Yes    | No             | No        |
| [Design: Visible focus](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/visible-focus)                                                                                    | Yes    | No             | Yes       |
| [Design: Consistency](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/consistency)                                                                                        | Yes    | No             | No        |
| [Design: Choice](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/choice)                                                                                                  | Yes    | No             | No        |
| [Design: Adjustability](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/adjustability)                                                                                    | Yes    | No             | No        |
| [Design: Flicker](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/flicker)                                                                                                | Yes    | No             | No        |
| [Editorial: Consistent labelling](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/consistent-labelling)                                                                  | Yes    | No             | No        |
| [Editorial: Indicating language](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/indicating-language)                                                                    | Yes    | No             | Yes       |
| [Editorial: Instructions](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/instructions)                                                                                  | Yes    | No             | No        |
| [Focus: Focusable elements](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/focusable-elements)                                                                          | Yes    | No             | Yes       |
| [Focus: Keyboard trap](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/keyboard-trap)                                                                                    | Yes    | No             | No        |
| [Focus: Content order](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/content-order)                                                                                    | Yes    | No             | No        |
| [Focus: Focus order](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/focus-order)                                                                                        | Yes    | No             | No        |
| [Focus: Changing focus](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/changing-focus)                                                                                  | Yes    | No             | Yes       |
| [Focus: Appropriate triggers](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/appropriate-triggers)                                                                      | Yes    | No             | No        |
| [Focus: Alternative input methods](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/alternative-input-methods)                                                            | Yes    | No             | No        |
| [Forms: Labelling form controls](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/labelling-form-controls)                                                                | No     | No             | Yes       |
| [Forms: Input format](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/input-format)                                                                                      | Yes    | No             | No        |
| [Forms: Form layout](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/form-layout)                                                                                        | Yes    | No             | No        |
| [Forms: Grouping form elements](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/grouping-form-elements)                                                                  | Yes    | No             | No        |
| [Images: Images of text](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/images-of-text)                                                                                  | Yes    | No             | No        |
| [Images: Background images](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/background-images)                                                                            | Yes    | No             | No        |
| [Links: Descriptive links](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/descriptive-links)                                                                            | Yes    | No             | No        |
| [Links: Links to alternative formats](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/inks-to-alternative-formats)                                                        | Yes    | No             | No        |
| [Links: Combining repeated links](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/combining-repeated-links)                                                              | Yes    | No             | No        |
| [Notifications: Inclusive notifications](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/inclusive-notifications)                                                        | Yes    | No             | No        |
| [Notifications: Standard operating system notifications](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/standard-operating-system-notifications)                  | Yes    | No             | No        |
| [Notifications: Error messages and correction](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/error-messages-and-correction)                                      | Yes    | No             | No        |
| [Notifications: Feedback and assistance](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/feedback-and-assistance)                                                        | Yes    | No             | No        |
| [Scripts and dynamic content: Progressive functionality](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/progressive-functionality)                                   | Yes    | No             | No        |
| [Scripts and dynamic content: Controlling media](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/controlling-media)                                                      | Yes    | No             | No        |
| [Scripts and dynamic content: Page refreshes](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/page-refreshes)                                                            | Yes    | No             | No        |
| [Scripts and dynamic content: Timeouts](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/timeouts)                                                                        | Yes    | No             | No        |
| [Scripts and dynamic content: Input control](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/input-control)                                                              | Yes    | No             | No        |
| [Structure: Unique page/screen titles](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/unique-pagescreen-titles)                                                          | Yes    | Yes            | No        |
| [Structure: Headings](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/headings)                                                                                          | No     | No             | Yes       |
| [Structure: Containers and landmarks](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/containers-and-landmarks)                                                          | Yes    | No             | Yes       |
| [Structure: Grouped elements](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/grouped-elements)                                                                          | Yes    | No             | No        |
| [Text equivalents: Alternatives for non-text content](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/alternatives-for-non-text-content)                                | Yes    | No             | Yes       |
| [Text equivalents: Decorative content](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/decorative-content)                                                                | Yes    | No             | No        |
| [Text equivalents: Tooltips and supplementary information](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/tooltips-and-supplementary-information)                       | Yes    | No             | Yes       |
| [Text equivalents: Roles, traits and properties](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/roles-traits-and-properties)                                      | Yes    | No             | No        |
| [Text equivalents: Visual formatting](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/visual-formatting)                                                                  | Yes    | No             | Yes       |

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


### Focus: Changing focus

| Test Name                                                        | Test Type |
| ---------------------------------------------------------------- | --------- |
| Focus or context must not automatically change during user input | manual    |
| Forms must have submit buttons                                   | automated |


### Focus: Appropriate triggers

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


### Forms: Input format

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

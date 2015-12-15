# Use `title` attributes

  `title` attributes **must not** be used for critical information and **must not** repeat content that is already visible and associated with the same control or content.

  Rationale
  =========

  `title` attributes are inaccessible to keyboard users without additional Assistive Technology. They are dependent on user settings in Screen Readers and similar Assistive Technology.

  Additionally they suffer from discoverability problems: pointing device users are required to hover over page elements and pause before the title tooltip displays, usually with no indication that there is additional content to be displayed.

  Repeating content in visible text and `title` attributes can lead to content clutter and repeated phrases.

  Key recommendations are:

  - Do not use the `title` attribute unless on a form input as title text is not well supported on links on mobile
  - Do not use `title` attributes and explicit labels together on form fields

  Techniques
  ==========

  Pass:

      <label for="name">Name</label>
      <input type="text" id="name" name="name" />
      <label for="email">Email</label>

      <input type="text" id="email" name="email" />

      <button type="button"><img src="/path/to/image/close.png" alt="Close" /></button>

  Fail:

      <input type="text" name="name" title="Name" />
      <input type="text" name="email" title="Email" />

      <label for="name">Name</label>
      <input type="text" id="name" name="name" title="Name" />

      <button type="button" title="Close"></button>

      <a href="/news" title="News">News</a>

  Tests
  =====

  | Procedure | Expected Result | Type |
  | --------- | --------------- | ---- |
  | Search source for all uses of the `title` attribute | Ensure no instances contain content that would be required by all users or content that is repeated in associated content | Manual |
  | Search source for all uses of the `title` attribute | Ensure no instances contain content that is repeated within the element | Automated |
  | Search source for all '<label>' elements and their associated form fields | Ensure that the associated form field does not have a title attribute | Automated |

  --

  Notes
  =====

  The first test is non-automatable, and may well have to be removed as it is too ambiguous.

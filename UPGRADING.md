# Upgrading your project for compatibility with bbc-a11y 3.0

As of version 3, bbc-a11y is built to support Node.js 20 and above only.

If you are using an older version of Node.js, please upgrade to the latest
version of Node.js.

Alongside this, from this version, bbc-a11y is now published as an npm package
as `@bbc/a11y` rather than `bbc-a11y`.

If you are using bbc-a11y as a dependency in your project, you will need to update
your dependency to use the new package name.

# Upgrading your project for compatibility with bbc-a11y 2.0

As of version 2.0.0, bbc-a11y now follows the
[BBC Mobile Accessibility Guidelines](https://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile)
instead of the legacy [HTML Accessibility Standards](https://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/).

Users with configuration files that refer to tests by name will need to update
their configuration accordingly. This should only affect configuration of pages
that includes `skip` or `only` options.

For example, if you have the following in your `a11y.js` configuration file:

```js
page("http://your/project/url", {
  skip: [
    'Headings: Exactly one main heading',
    'Main landmark: Exactly one Main landmark'
  ]
})
```
...you will need to update the name of the tests to reflect the MAG structure:

```js
page("http://your/project/url", {
  skip: [
    'Structure: Headings: Exactly one main heading',
    'Structure: Containers and landmarks: Exactly one main landmark'
  ]
})
```

The following table summarises the old and new names:

| bbc-a11y v1 name                                                                      | bbc-a11y v2 name                                                                                      |
| ------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| Validation: Markup must validate against doctype                                      | Principles: Markup must validate against doctype                                                      |
| Validation: All documents must have a W3C recommended doctype                         | Principles: All documents must have a W3C recommended doctype                                         |
| Indicating language: Html must have lang attribute                                    | Editorial: Indicating language: Html must have lang attribute                                         |
| Page titles: Title element must identify main content                                 | Structure: Unique page/screen titles: Title element must identify main content                        |
| Main landmark: Exactly one Main landmark                                              | Structure: Containers and landmarks: Exactly one main landmark                                        |
| Headings: Exactly one main heading                                                    | Structure: Headings: Exactly one main heading                                                         |
| Headings: Headings must be in ascending order                                         | Structure: Headings: Headings must be in ascending order                                              |
| Headings: Content must follow headings                                                | Structure: Headings: Content must follow headings                                                     |
| Minimum text size: Text cannot be too small                                           | Design: Content resizing: Text cannot be too small                                                    |
| Resizable text: Text must be styled with units that are resizable in all browsers     | Design: Content resizing: Text must be styled with units that are resizable in all browsers           |
| Tab index: Zero Tab index must only be set on elements which are focusable by default | Focus: Focusable elements: Zero tab index must only be set on elements which are focusable by default |
| Title attributes: Title attributes only on inputs                                     | Text equivalents: Tooltips and supplementary information: Title attributes only on inputs             |
| Title attributes: Title attributes must not duplicate content                         | Text equivalents: Tooltips and supplementary information: Title attributes must not duplicate content |
| Focusable controls: Anchors must have hrefs                                           | Principles: Anchors must have hrefs                                                                   |
| Visible on focus: Elements must be visible on focus                                   | Design: Visible focus: Elements must be visible on focus                                              |
| Image alternatives: Images must have alt attributes                                   | Text equivalents: Alternatives for non-text content: Images must have alt attributes                  |
| Form labels: Fields must have labels or titles                                        | Forms: Labelling form controls: Fields must have labels or titles                                     |
| Form interactions: Forms must have submit buttons                                     | Forms: Managing focus: Forms must have submit buttons                                                 |
| Tables: Use tables for data                                                           | Text equivalents: Visual formatting: Use tables for data                                              |

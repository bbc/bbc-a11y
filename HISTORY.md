# v2.3.0

- Main heading (h1) no longer required to be the first heading.

# v2.2.6

- Disallows nested headings when no content between them, via [#277](https://github.com/bbc/bbc-a11y/pull/277)

# v2.2.5

- Fixes Travis build by updating expected terminal output

# v2.2.4

- package.json needs bbc-a11y 'bin' property for Docker

# v2.2.3

- Updated package.json properties so that bbc-a11y is more consumable

# v2.2.2

- Updated dependencies to fix all current vulnerabilities

# v2.2.1

- Fixed "Text must be styled with units that are resizable in all browsers" standard failing when using a font-size of `inherit`

# v2.2.0

- Fixed "Text must be styled with units that are resizable in all browsers" standard always failing, despite using only `rem` or `em`
- Fixed the "Content must follow headings" standard to account for iframes with content after headings
- Added information to guides about getting help or finding out the version number from the CLI
- Added more information to guides about running bbc-a11y within a CI environment

# v2.1.0

- Upgrades dependencies including a major electron update (now at v2.0.2)
- Moves cucumber to development dependencies

# v2.0.0

- bbc-a11y now follows the BBC Mobile Accessibility Guidelines instead of the
  legacy HTML Accessibility Guidelines. All existing tests have been renamed
  accordingly.

  See UPGRADING.md in this repository for details about how to migrate your
  project

# v1.4.0

- Added support for manual tests using the --manual switch

# v1.3.0

- Added a JSON reporter

# v1.2.0

- Added support for validating pages at different viewport widths

# v1.1.0

- Fixed an issue with the "Content must follow headings" check that was
  generating lots of false negatives for some users

# v1.0.0

- Implemented bbc-a11y as an npm module using [electron](http://electron.atom.io/)

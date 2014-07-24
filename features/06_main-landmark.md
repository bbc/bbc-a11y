# Identify main content

A page **must** have exactly one element with `role="main"`

## Rationale

The WAI-ARIA `main` landmark role can be help keyboard users with assistive technologies such as screen readers (and in the future as native browser functionality) to skip directly to the main content of a page, bypassing navigation and other contents that might be before it.

## Techniques

Pass:

	<div role="main" id="main-content"></div>

Fail:

	<div id="main-content"></div>

## Tests

| Procedure | Expected Result | Type | 
| --------- | --------------- | ---- |
| Search source for `role="main"` | There should be one instance of `role="main"` as an attribute of an HTML element | Manual |

--

## Notes

Just a straight forward test for one and only one element with this attribute and value.
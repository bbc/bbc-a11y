# Links must be self-evident

Links that are part of general editorial content **must** be identifiable by there visual style and be distinguishable from the surrounding content.

Text links **must** have a mouse-over state change.

## Rationale

To aid discoverability all links must be made self-evident with their visual style.

Appropriate styles are:

- underlined
- a different colour, meeting contrast standards, to the surrounding text

When hovered over links should have a change in style as confirmation that they are links.

Appropriate styles are:

- adding an underline to previously not underlined content
- a change in colour, with a sufficiently different contrast to meet the contrast standard compared with the default state colour

## Techniques

Pass:

	<style>
		body {
			background: #fff;
			color: #000;
		}

		a {
			color: #005580;
			text-decoration: none;
		}

		a:focus,
		a:hover {
			background: 
			text-decoration: underline;
		}
	</style>
	
	<a href="http://www.bbc.co.uk/">BBC</a>

Fail:

	<style>
		body {
			background: #fff;
			color: #000;
		}

		a {
			color: #000;
			text-decoration: none;
		}
	</style>
	
	<a href="http://www.bbc.co.uk/">BBC</a>

## Tests

| Procedure | Expected Result | Type | 
| --------- | --------------- | ---- |
| For every `<a>` element check the visual style | All `<a>` elements must be visually distinguishable from the surrounding content | Manual |
| For every `<a>` element check the visual style of the `:hover` state | All `<a>` elements must have a visually distinguishable style between `:link` and `:hover` states | Manual |

--

## Notes

Might be difficult to automate the first test. It might be possible (but expensive) to check every link on a page against the style of its parent element, comparing colour, underlines, weight, and other styles but at best I feel this could only be an error if there are no style changes.

The second test is testing two states of the same element so might not be quite as difficult (providing you have access to the :hover styles) but it's still hard to have a high degree of confidence in the outcome.

Perhaps we need to have a warning rather than an error for these tests.
# Visually hidden elements must be made visible on focus

Hidden elements in tab order **must** be made visible on focus.

## Rationale

While it sometimes beneficial to provide content to screen reader users only, not all keyboard users also use a screen reader. Having hidden content in tab order, such as `<a>` or `<button>` elements, that remain hidden when focussed causes confusion for keyboard users that do not also use a screen reader.

It is recommened to use a clipping technique instead of negative positioning because of problems this can cause in iOS7 Safari, but either approach is accessible.

## Techniques

Pass:

	<style>
	.hidden {
	    position: absolute; /* clip only relevant on absolutely positioned elements */
	    overflow: hidden;
	    height: 1px;
	    width: 1px;
	    clip: rect(1px 1px 1px 1px); /* For IE6, IE7 */
	    clip: rect(1px, 1px, 1px, 1px);
	}


	.hidden:focus {
	    height: auto;
	    width: auto;
	    clip: auto;
	}
	</style>

	<a href="http://www.bbc.co.uk/" class="hidden">BBC</a>

Fail:

	<style>
	.hidden {
		position: absolute;
		top: -999em;
	}
	</style>

	<div class="hidden">
		<a href="http://www.bbc.co.uk/">BBC</a>
	</div>

## Tests

| Procedure | Expected Result | Type | 
| --------- | --------------- | ---- |
| Tab through all elements in the document. Depending on browser / operating system you may need to activate tabbing through all controls (see [Enabling keyboard navigation in Mac OS X Web browsers](http://www.456bereastreet.com/archive/200906/enabling_keyboard_navigation_in_mac_os_x_web_browsers/) for OSX) | All elements in tab order must be visible when they receive focus | Manual |

--

## Notes

Matt: I don't see how this can be automated, but it would be great if I was wrong.
# Correctly use form labels

Form fields that allow input (`select`, and `textarea` elements, and all `input` element types other than image, submit, reset, button, or hidden) **must** have an associated label, either in the form of a `<label>` element or, for simple forms when no visible label is required, a `title` attribute.

## Rationale

Form labels are important for all users in order to understand what the form field is however they are essential for speech output users who cannot easily infer what the form element is by looking at the surrounding content.

While there are WAI-ARIA attributes that allow for labelling of forms it is not supported in all versions of assistive technologies that BBC users could reasonably expect to be able to use.

## Techniques

Pass:

	<label for="search">Search the BBC</label>
	<input type="text" id="search" name="q" />

	<label for="search">
		Search the BBC
		<input type="text" name="q" />
	</label>

	<input type="text" name="q" title="Search the BBC" />

Fail:

	<input type="text" name="name" title="Name" />
	<input type="text" name="email" title="Email" />

	<input type="text" name="q" value="Search the BBC" />

	<input type="text" name="q" aria-label="Search the BBC" />

	<input type="text" name="q" placeholder="Search the BBC" />

## Tests

| Procedure | Expected Result | Type | 
| --------- | --------------- | ---- |
| Use WAVE Toolbar (or similar) to identify accessibility errors errors | There must be no 'ERROR: Form label missing' or 'ARIA label or description' messages | Tool |
| Check every `select`, and `textarea` elements, and all `input` element types other than image, submit, reset, button, or hidden | Every element must have either an associated `<label>` or a title attribute | Manual / Automated |

--

## Notes

Hopefully the second test can be automated. Associated labels are those that wrap the element (`<label>Foo <input type="text" /></label>`) and those that have a `for` attribute value that matches the `id` attribute of a field element (`<label for="foo">Bar</label><input type="text" id="foo" />`). In the second case the `<label>` can wrap the form element, but does not have to.
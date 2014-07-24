# Provide a unique document `<title>`

Documents **must** have a page `<title>` that identifies its main content.

## Rationale

Document titles help users orientate themselves within web sites and apps. The document `<title>` element content is often the first thing a speech output user will hear and acts as a confirmation of what page they have arrived at. Document titles commonly have the same content as the main `<h1>` element.

## Techniques

Pass:

	<title>BBC Weather</title>

Fail:

	<title>BBC</title>

## Tests

| Procedure | Expected Result | Type | 
| --------- | --------------- | ---- |
| Examine the title text of each document, either in a browser's tab control or by viewing the document source and searching for the `<title>` element | The document title should describe the primary content of the document | Manual |

--

## Notes

We can't easily test for the uniqueness of the title, but we can test for the presence of the element and ensure it has content.

In terms of prompting for manual tests, could we compare the title element with the content of the first `<h1>` element on the page, and if the former contains the latter then automatically pass the test. For example:

	<title>BBC Weather - Weather in London</title>

	~

	<h1>Weather in London</h1>

would pass automatically, a `<title>` element that does not contain the string 'Weather in London' would be flagged for manual review.
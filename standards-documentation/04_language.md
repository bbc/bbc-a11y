# HTML

## Specify content language

The main language of the page **must** be specified.

Changes to language within the page **must** be indicated.

### Rationale

Assistive technologies such as screen readers have support for different languages, allowing for appropriate pronunciation.

### Techniques

Pass:

	<!DOCTYPE html>
	<html lang="en-GB">
	<head>
		<title>Language techniques</title>
	</head>
	<body>
		<h1>Techniques for language in HTML</h1>
		<p><span lang="es">Cinco de Mayo</span> is Spanish for "fifth of May"</p>
	</body>
	</html>

Fail:

	<!DOCTYPE html>
	<html>
	<head>
		<title>Language techniques</title>
	</head>
	<body>
		<h1>Techniques for language in HTML</h1>
		<p>Cinco de Mayo is Spanish for "fifth of May"</p>
	</body>
	</html>

### Tests

| Procedure | Expected Result | Type | 
| --------- | --------------- | ---- |
| Search source for `<html>` element | `<html>` element must have a `lang` attribute with a value equal to the language code for the main page content language | Manual |
| Validate the page against the [W3C Internationalization Checker](http://validator.w3.org/i18n-checker/) | There must not be a 'The html tag has no language attribute' warning, and the Language HTML tag value should match the language code for the main page content language | Tool |
| Search source for each instance of a language change | Each instance should have a containing element with a `lang` attribute with a value equal to the language code for the language | Manual |

# Notes

We can't reasonably test that changes in language are marked up correctly, but we can make sure that the document has a lang attribute with a valid language code.
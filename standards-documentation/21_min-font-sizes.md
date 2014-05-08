# HTML

## Minimum text size

At default browser level all text **must** have a minimum calculated size of 11px and all core content **must** have a minimum calculated size of 13px.

### Definitions

#### Core content

The content that is required to fulfil the core purpose of the document or feature.

### Rationale

Having a minimum text size will reduce the number of users who need to make use of browser based text resize or page zoom. This is a particular issue with an ageing audience, many of whom will not consider themselves as having low vision and there will not have access to assistive technology or be familiar with browser tools to resize content.

### Techniques

Pass:

	<style>
		body {
			font-size: 62.5%; /* Set default size of 1em to 10px */
		}

		.news-article p {
			font-size: 1.3em; /* Primary content size set to 13px */
		}

		.news-supplimentary-links {
			font-size: 1.2em; /* Secondary content size set to 12px */
		}
	</style>

Fail:

	<style>
		body {
			font-size: 62.5%; /* Set default size of 1em to 10px */
		}

		.news-article p {
			font-size: 1.2em; /* Primary content size set to 12px */
		}

		.news-supplimentary-links {
			font-size: 1em; /* Secondary content size set to 10px */
		}
	</style>

### Test

| Procedure | Expected Result | Type | 
| --------- | --------------- | ---- |
| For every piece of text of different sizes check the computed text size | All content must have a minimum size of 11px | Manual, automatable |
| For every piece of core content text of different sizes check the computed text size | All core content must have a minimum size of 13px | Manual |

# Notes

The core content problem again so we can only realistically automate testing against the 11px minimum.

It could be an expensive operation to get the computed style for every text node in a document, and it is tests like this that made me think about having grades of tests based on how quickly they are likely to run. You don't need to run this test every time a CSS change is made, but it is worth running before committing.

It is likely that entire parts of the page will be considered 'core', for example everything in the page `<main>` element, so would it be possible to write this in such a way as to make it easy for individualy products to add their custom rules to test for the 13px minimum within certain elements?
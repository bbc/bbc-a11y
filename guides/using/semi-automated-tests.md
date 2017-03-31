# Semi-automated tests

Some standards need additional configuration before they are run. These are
considered optional, so they will not generate warnings if you don't configure
them. The following tests are semi-automated:

### Page titles

The `title` page configuration setting should be set to one of:

  * a string with the exact title
  * a string with a template part containing a CSS selector, for example
    `Site Name - {h1:first}`
  * a function taking a jQuery object as an argument and returning the title

This setting will be matched against should the inner text of the `<title>`
element, for example each of these tests will pass:

```js
// Given the HTML at http://www.bbc.co.uk/news/technology-39419728 includes:
// <title>Uber set to pull out of Denmark - BBC News</title>

page('http://www.bbc.co.uk/news/technology-39419728', {
  title: 'Uber set to pull out of Denmark - BBC News'
})

page('http://www.bbc.co.uk/news/technology-39419728', {
  title: '{h1:first} - BBC News'
})

page('http://www.bbc.co.uk/news/technology-39419728', {
  title: $ => $('h1:first').text() + ' - BBC News'
})
```

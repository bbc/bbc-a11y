# Semi-automated tests

Some standards need additional configuration before they are run. These are
considered optional, so they will not generate warnings if you don't configure
them. The following tests are semi-automated:

### Page titles

The `pageTitleFormat` page configuration setting is set to a function which
should return the inner text of the `<title>` element. Usually this should
correspond to the main heading on the page, for example:

```
page("http://www.bbc.co.uk/news/business-39383896", {
  pageTitleFormat: $ => $('h1').text() + ' - BBC News'
})
```

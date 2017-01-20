## BBC A11y User Guide

## Installing bbc-a11y to validate your project

bbc-a11y is packaged as an npm module. You'll most likely want to create a
stand-alone repo to run your accessibility tests, but you can also add it as
part of an existing repo.

### Prerequisites

[Install node.js](https://docs.npmjs.com/getting-started/installing-node) and
then create a `package.json` file in your project using the `npm` command line
tool that comes with node.js:

    npm init

### Add a11y to your project's dependencies

Add bbc-a11y to your project with npm:

    npm install bbc-a11y

## Configuring a11y for your project

You'll need to configure a11y with a set of URLs to run the checks against.
Create a file called `a11y.js` in the root of your project that looks something
like this:

```js
page("http://bbc.co.uk")
page("http://bbc.co.uk/news")
```

### Skipping standards checks

Nobody's perfect. Use `skip` in the configuration to opt-out of certain
checks.

```js
page("http://bbc.co.uk", {
  skip: [
    'Focusable controls: Anchors must have hrefs',
    'Headings: exactly one main heading'
  ]
})

page("http://bbc.co.uk/news")
```

bbc-a11y will skip any standards whose name matches those strings. Or you could
use `only` when you want to focus your attention on just one problem:

```js
page("http://bbc.co.uk", {
  only: 'Focusable controls: Anchors must have hrefs'
})
```

## Viewport Width

Because responsive web pages can vary depending on the width of the browser
browser window, bbc-a11y allows the viewport width to be specified. Either
you can pass a command line argument when checking a single URL, like this:

    ./node_modules/.bin/bbc-a11y http://www.bbc.co.uk --width=800

...or you can add an option to any page in your configuration file like this:

```js
page("http://bbc.co.uk", {
  width: 800
})
```

To test the same URL with multiple widths, you can loop over the widths in your
configuration file, for example:

```js
[800, 1000].forEach(width => page("http://bbc.co.uk", { width }))
```

## Running it

Once you're configured, you can run the tests using the `bbc-a11y` command, from
the directory where your `a11y.js` configuration file is stored:

    ./node_modules/.bin/bbc-a11y

This will pick up your `a11y.js` configuration file and run the a11y checks on
each page specified in your configuration. Output is printed to the console.

## Interactive mode

To debug failures, running bbc-a11y in _interactive mode_ will show a browser
window with development tools, allowing you to explore the failures and the
elements that relate to each failure:

    bbc-a11y http://www.bbc.co.uk --interactive

## Using a11y in build scripts

The `bbc-a11y` executable will exit with a non-zero status code if there are any
standards failures, for convenient integration with CI tools like Jenkins.

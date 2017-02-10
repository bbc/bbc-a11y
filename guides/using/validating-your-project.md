# Using bbc-a11y to validate your web project

If you have a web project, the best way to use bbc-a11y is to install it in your
project repository, so that everybody on the team can validate the accessibility
of your app at any time.

## Prerequisites

[Install node.js](https://docs.npmjs.com/getting-started/installing-node) and
then create a `package.json` file in your project using the `npm` command line
tool that comes with node.js:

    npm init

## Add a11y to your project's dependencies

Once you have a package.json file, add bbc-a11y to your development
dependencies like this:

    npm install bbc-a11y --save-dev

## Configuring a11y for your project

You'll need to configure a11y with a set of URLs to run the checks against.
Create a file called `a11y.js` in the root of your project that looks something
like this:

```js
page("http://bbc.co.uk")
page("http://bbc.co.uk/news")
```

## Running bbc-a11y

Once you're configured, you can run the tests using the `bbc-a11y` command, from
the directory where your `a11y.js` configuration file is stored:

    ./node_modules/.bin/bbc-a11y

This will pick up your `a11y.js` configuration file and run the a11y checks on
each page specified in your configuration. Output is printed to the console.

This is a bit cumbersome to type, so we recommend that you add a task to the
`scripts` section of your package.json file, like this:

```json
{
  "name": "your-web-project",
  "scripts": {
    "a11y": "bbc-a11y"
  }
}

After doing this, you can run bbc-a11y via npm, like this:

    npm run a11y

```

## Interactive mode

To debug failures, running bbc-a11y in _interactive mode_ will show a browser
window with development tools, allowing you to explore the failures and the
elements that relate to each failure:

    ./node_modules/.bin/bbc-a11y http://www.bbc.co.uk --interactive

## Skipping standards checks

Nobody's perfect. Use `skip` in the configuration to opt-out of certain
checks.

```js
page("http://bbc.co.uk", {
  skip: [
    'Focusable controls: Anchors must have hrefs',
    'Headings: Exactly one main heading'
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

## Hiding errors

To hide particular errors, for example if there are areas of the page which you
cannot control, use `hide` in your page configuration, like this:

```js
// hide all errors that mention 'orb-modules' anywhere
page("http://bbc.co.uk", {
  hide: 'orb-modules'
})

// hide all errors that mention 'heading' or 'Text size'
page("http://bbc.co.uk", {
  hide: ['heading', 'Text size']
})
```

## Setting the viewport width

Because responsive web pages can vary depending on the width of the browser
browser window, bbc-a11y allows the viewport width to be specified. Either
you can pass a command line argument when checking a single URL, like this:

    ./node_modules/.bin/bbc-a11y http://www.bbc.co.uk --width 800

...or you can add an option to any page in your configuration file like this:

```js
page("http://bbc.co.uk", {
  width: 800
})
```

If you don't specify a width, the viewport will be 1024px wide.

To test the same URL with multiple widths, you can loop over the widths in your
configuration file, for example:

```js
[800, 1000].forEach(width => page("http://bbc.co.uk", { width }))
```

## Specifying a configuration file path

Use the `--config` command line option to specify an alternative location for
the configuration file:

    ./node_modules/.bin/bbc-a11y --config ./path/to/a11y.js

## Using a11y in build scripts

The `bbc-a11y` executable will exit with a non-zero status code if there are any
standards failures, for convenient integration with CI tools like Jenkins.

## Output results in JSON format

Override the human-readable output format with JSON instead like this:

    ./node_modules/.bin/bbc-a11y --reporter json

## Using a custom reporter

If your CI system renders reports in different format, you can write your own
reporter module and specify the path to it using the `--reporter` command line
option:

    ./node_modules/.bin/bbc-a11y --reporter ./path/to/reporter.js

See the (custom reporter feature)[../../features/custom_reporter.feature] for
an example of the reporter API.

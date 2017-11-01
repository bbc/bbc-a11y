# Testing a website using bbc-a11y

## Installing bbc-a11y on your system

bbc-a11y uses a technology called node.js, so you'll need to
[download and install node.js](https://nodejs.org/en/download/) to get started.

Once you've downloaded node.js, you can open a terminal window and enter the
following command:

   $ sudo npm install bbc-a11y --global

## Running bbc-a11y against your website

Once bbc-a11y is installed, you can use it to test your website in the same
terminal window, by typing `bbc-a11y` followed by your website's URL. For
example, here's how to test the BBC home page:

    $ bbc-a11y http://www.bbc.co.uk

To explore the test errors, you can run bbc-a11y in _interactive_ mode
by adding the `--interactive` command line flag, for example:

    $ bbc-a11y http://www.bbc.co.uk --interactive

This will show a browser window and show any test errors in the `Console`
tab of the embedded developer tools.

## Running manual tests

Some standards cannot be fully automated and need a person to answer questions.
Run bbc-a11y in _manual_ mode to include manual tests:

   $ bbc-a11y http://www.bbc.co.uk --manual

## Help

If you have any trouble using bbc-a11y as described here, please
[submit an issue](https://github.com/bbc/bbc-a11y/issues/new) and we will do our
best to help fix your problem.

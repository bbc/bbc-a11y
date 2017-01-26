# Contributing code changes

## Prerequisites

Before you can work on the bbc-a11y code you'll need to install a couple of
things on your system:

  * [node.js](https://nodejs.org/en/download/) (5.0+ is recommended)
  * [git](https://git-scm.com/downloads)

You'll also need a [Github account](https://github.com/join)

Once you are signed into Github you can [fork and clone the bbc-a11y repository](https://guides.github.com/activities/forking/).

Now that you have a copy of the code on your system you'll need to install the
development dependencies. Node.js ships with a package manager called
[npm](http://npmjs.org) which you can use from a command line to install these:

    npm install

Once that's finished you should then run all the tests to verify everything is
working as expected:

    npm test

You should see red if anything fails. If all tests pass, you are ready to start
hacking! If not, please get in touch and we'll help you figure it out.

## Adding and amending features and scenarios

Before working on changes you should briefly review the
[issues](https://github.com/bbc/bbc-a11y/issues) that have already been raised
via Github and the [cucumber features](../../features) as there may be similar
scenarios that are already implemented. Then you can change the features, or add
scenarios to cover new edge cases, or create new feature files.

Before spending time implementing code changes, we recommend that you
[raise an issue](https://github.com/bbc/bbc-a11y/issues/new) letting us know
what you intend to do, just to ensure your effort is not wasted.

## Implementing code changes

When it's time to implement your changes, you'll need to write JavaScript code.

There are high-level cucumber features and low-level specs, both implemented in
JavaScript. The cucumber features are generally broad in scope and the low-level
tests cover finer details like individual modules and classes. Please try to
add scenarios and/or tests for any changes that you make, and don't be afraid to
ask for help.

When all your tests pass, push the changes up to your fork and make a comment
on your pull request and the bbc-a11y team will review your work before merging
it into the project.

Happy hacking!

# BBC A11y Contributing Guidelines

## How can I contribute?

We welcome contributions of all shapes and sizes, but we prefer them in the form
of Github [issues](https://github.com/bbc/bbc-a11y/issues/new) or [pull requests](https://help.github.com/articles/using-pull-requests). Please have a quick look at our [existing
issues](https://github.com/bbc/bbc-a11y/issues) before posting, as you may find we are already thinking about or working
on a fix.

## Improving standards checks

If you believe there is a bug or misinterpretation of the BBC Accessibility
Guidelines, please submit an issue with as much relevant detail as possible.
Ideally this should include an HTML snippet that demonstrates the problem. Even
more ideally, you can create or amend a scenario in one of our [cucumber features](features/check_standards).

## Contributing code

Contributions of code are very welcome. You'll need to do a little bit more
setup before you can start hacking on the code:

### Prerequisites

You'll need to install a few things on your system before you can work on the
code:

  * Ruby (1.9.3 is required, 2.0+ is recommended)
  * node.js (5.0+ is recommended)
  * phantomjs

Once those are installed, you can install the Ruby dependencies:

  ```
  gem install bundle
  bundle install
  ```

...and the node.js dependencies:

  ```
  npm install
  ```

...then finally run all the tests to verify:

  ```
  bundle exec rake
  ```

You should see red if anything fails. If all tests pass, you are ready to start
hacking! If not, please get in touch and we'll help you figure it out.

### Amending features

It usually makes sense to start by briefly reviewing the [cucumber
features](features) as there may be similar scenarios already implemented. Then
change the features, or add scenarios to cover new edge cases, or create new
feature files.

When you are done changing feature files, we recommend that you submit a pull
request, to get feedback from the a11y team before implementing your change.

### Implementing code changes

When it's time to implement your changes, you might need to write Ruby, or
JavaScript, or both. The standards checks are implemented in JavaScript,
whereas the command-line runner is implemented in Ruby.

There are high-level cucumber features, and low-level specs for both Ruby and
JavaScript. The cucumber features are generally broad in scope have more moving
parts, so depending on the change, it can be difficult to understand why things
fail, and to iterate on changes. In this case you should consider writing or
amending the low-level [JavaScript specs for the standards](spec/bbc/a11y/js)
or [Ruby specs for the runner](spec/bbc/a11y).

When all tests pass, please submit a pull request and the team will review it.

Happy hacking!

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
more ideally, you can create or amend a scenario in one of our
[cucumber features](features/check_standards).

If you have any issue with one of the standards checks, please submit a Github
issue, including a snippet of HTML that demonstrates the problem. There is a
template in Github that you can follow when you create an issue.

## Contributing code

Contributions of code are very welcome. You'll need to do a little bit more
setup before you can start hacking on the code:

### Prerequisites

You'll need to install a few things on your system before you can work on the
code:

  * node.js (5.0+ is recommended)

Once those are installed, you can install the npm dependencies:

  npm install

...then finally run all the tests to verify:

  npm test

You should see red if anything fails. If all tests pass, you are ready to start
hacking! If not, please get in touch and we'll help you figure it out.

## Troubleshooting

Modern builds of OS X / MacOS exhibit an issue with ruby-2.0.0. If on `bundle install` you get an issue resembling `rack-2.0.1 requires ruby version >= 2.2.2, which is incompatible with the current version,
ruby 2.0.0p648`, you may need to upgrade to a more recent Ruby build. 

You can do this with a versioning manager, such as [RVM](http://rvm.io).

For example, having installed RVM, you need to install the relevant version of Ruby:

  ```
  rvm install ruby-2.3.3
  ```

...then ensure you're using the new version:

  ```
  rvm use ruby-2.3.3
  ```

And then you need to follow the above instructions again, from `gem install bundle` onwards

## Process

The basic process for contributing code is as follows:

1. Clone the [Github repo](https://github.com/bbc/bbc-a11y) to your machine.
2. Familiarise yourself with the [issues](https://github.com/bbc/bbc-a11y) that have already been raised via Github.
3. If you wish to raise an issue via Github, please do so after checking through existing issues.
4. If you wish to work on an issue, please check that no one else is, then assign it to yourself.
5. Create a suitably named branch to work in and commit to, that includes the issue number, eg. i36-focus-styles-test.
6. If you think you have completed your solution, please submit a pull request for others to review. Do not merge the branch to master.

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

There are high-level cucumber features, and low-level specs, both implemented in
JavaScript. The cucumber features are generally broad in scope have more moving
parts, so depending on the change, it can be difficult to understand why things
fail, and to iterate on changes. In this case you should consider writing or
amending the low-level [JavaScript specs for the standards](spec/bbc/a11y/js)
or [Ruby specs for the runner](spec/bbc/a11y).

When all tests pass, please submit a pull request and the team will review it.

Happy hacking!

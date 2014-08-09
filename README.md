# BBC Accessiblity Standards

This tool runs a set of tests against a given URL to verify whether it meets the BBC accessiblity standards.

## How to use

Run the `a11y` command, passing a URL:

e.g.

    a11y http://bbc.co.uk

You can also pass arguments to Cucumber (which is used internally) by separating the arguments with `--`. Everything
after the `--` is passed directly to Cucumber. For example, to skip the tests that require manual interraction:

    a11y http://bbc.co.uk -- -t ~@manual

## How to install

A11y is packaged as a Ruby gem, but is not yet available on the public Rubygems server. To install it, you'll need to either build it by hand, or add a reference to the github source in your Gemfile.

### Prerequisites

Install Ruby and `gem install bundler`.

### Adding a11y to your project's Gemfile

Open your project's `Gemfile` and this line:

    gem 'bbc-a11y`, git: 'git@github.com:mattwynne/bbc-a11y.git'

Now run `bundle install` to install it.

*Note:* You'll need to make sure every user who wants to run `bundle install` (including your continuous integration environment) has at least read access to this Github project.

### Build and install the gem manually

This will install the `a11y` tool globally on your machine.

1. Clone this repository
2. Install dependencies

    ~~~
    cd bbc-a11y
    bundle install
    ~~~

3. Install the gem

    ~~~
    bundle exec rake install
    ~~~


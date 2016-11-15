## BBC A11y User Guide

## Installing bbc-a11y to validate your project

bbc-a11y is packaged as a Ruby gem. You'll most likely want to create a
stand-alone repo to run your accessibility tests, but you can also add it as
part of an existing repo.

### Prerequisites

[Install Ruby](https://www.ruby-lang.org/en/documentation/installation/) and
then:

    gem install bundler

### Adding a11y to your project's Gemfile

Create or amend your your project's `Gemfile` to include the `bbc-a11y` gem:

```ruby
source 'https://rubygems.org'

gem 'bbc-a11y'
```

Now install the gem:

    bundle install

## Configuring a11y for your project

You'll need to configure a11y with a set of URLs to run the checks against.
Create a file called `a11y.rb` in the root of your project that looks something
like this:

```ruby
page "http://bbc.co.uk"
page "http://bbc.co.uk/news"
```

### Skipping standards checks

Nobody's perfect. Use `skip_standard` in the configuration to opt-out of certain
checks.

```ruby
page "http://bbc.co.uk" do
  skip_standard 'Focusable controls: Anchors must have hrefs'
end

page "http://bbc.co.uk/news"
```

A11y will skip any standards from whose name matches that string. Or you could
use `only_standard` when you want to focus your attention on just one problem:

```ruby
page "http://bbc.co.uk" do
  only_standard 'Focusable controls: Anchors must have hrefs'
end
```

## Running it

Once you're configured, you can run the tests using the `a11y` command, from the
directory where your `a11y.rb` configuration file is stored:

    bundle exec a11y

This will pick up your `a11y.rb` configuration file and run the a11y checks on
each page specified in your configuration. Output is printed to the console.

## Using a11y in build scripts

The `a11y` executable will exit with a non-zero status code if there are any
standards failures, for convenient integration with CI tools like Jenkins.

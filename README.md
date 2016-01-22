[![Circle CI](https://circleci.com/gh/cucumber-ltd/bbc-a11y.svg?style=svg&circle-token=00d656fd091643ad692c78ca60e30ad95df9563a)](https://circleci.com/gh/cucumber-ltd/bbc-a11y)

#BBC Accessibility Standards

This tool runs a set of tests against a set of URLs to verify whether each one meets the [BBC accessibility standards](http://www.bbc.co.uk/guidelines/futuremedia/accessibility/).

## How to install

bbc-a11y is packaged as a Ruby gem. You'll most likely want to create a stand-alone repo to run your accessibilty tests,
but you can also add it as part of an existing repo.

### Prerequisites

[Install Ruby](https://www.ruby-lang.org/en/documentation/installation/) and then:

    gem install bundler

### Adding a11y to your project's Gemfile

Create or amend your your project's `Gemfile` to include this line:

    gem 'bbc-a11y`

Now install the gem:

    bundle install

## Configuration

You'll need to configure a11y with a set of URLs to run the checks against. Create a file `a11y.rb` in the root of your project that looks something like this:

```
page "http://bbc.co.uk"
page "http://bbc.co.uk/news"
```

### Skipping scenarios

Nobody's perfect. Use `skip_standard` in the configuration to opt-out of certain checks.

```
page "http://bbc.co.uk" do
  skip_standard 'anchors must have hrefs'
end

page "http://bbc.co.uk/news"
```

A11y will skip any scenarios from the specifications whose name contains that string.

## Running it

Once you're configured, you can run the tests using the `a11y` command, from the directory where your `a11y.rb` configuration file is stored:

    bundle exec a11y

This will pick up your `a11y.rb` configuration file and run the a11y checks on each page specified in your configuration.
Output is printed to the console.

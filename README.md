#BBC Accessiblity Standards

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

You'll need to configure a11y with a set of URLs to run the checks against. Create a file `.a11y.rb` in the root of your project that looks something like this:

```
BBC::A11y.configure do
  page "http://bbc.co.uk"
  page "http://bbc.co.uk/news"
end
```

### Skipping scenarios

Nobody's perfect. Use `skip_scenario` in the configuration to opt-out of certain checks.

```
BBC::A11y.configure do
  page "http://bbc.co.uk" do
    skip_scenario "W3C"
  end

  page "http://bbc.co.uk/news"
end
```

A11y will skip any scenarios from the specifications whose name contains that string.

## Running it

Once you're configured, you can run the tests using the `a11y` command:

    bundle exec a11y

This will pick up your `.a11y.rb` configuration file and run the a11y features on each page specified in your configuration. 
Output is printed to the console.

# BBC Accessiblity Standards

This tool runs a set of tests against a given URL to verify whether it meets the BBC accessibility standards.

## How to install

A11y is packaged as a Ruby gem. You'll most likely want to create a stand-along repo to run your accessibilty tests,
but you can also add it as part of an existing repo.

### Prerequisites

Install Ruby and `gem install bundler`.

### Adding a11y to your project's Gemfile

Create or amend your your project's `Gemfile` to include this line:

    gem 'bbc-a11y`

Now install the gem:

    bundle install

## Configuration

You'll need to configure a11y so it knows which pages you want to hit. Create a file `.a11y.rb` in the root of your project:

```
BBC::A11y.configure do
  page "http://bbc.co.uk"
  page "http://bbc.co.uk/news"
end
```

### Skipping scenarios

In some cases, you'll want to disable certain scenarios for certain pages. Use the `skip_scenario` method in the configuration to achieve this:

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

Once you're configured, you can run the tests simply using the `a11y` command:

```
$ a11y
```

This will pick up your configuration file and run the a11y features on each page specified in your configuration. 
Output is printed to the console.

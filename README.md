# BBC Accessiblity Standards Checker

This tool runs a set of tests against a given URL to verify whether it meets the BBC accessiblity standards.

## How to install

A11y is packaged as a Ruby gem, but is not yet available on the public Rubygems server. To install it, 
you'll need to pull down the source and build the gem yourself.

1. Install Ruby and `gem install bundler`
2. Clone this repository
3. Install dependencies

    ~~~
    cd bbc-a11y
    bundle install
    ~~~

4. Install the gem

    ~~~
    bundle exec rake install
    ~~~

Alternatively, you can add this line to your project's Gemfile:

    ~~~
    gem 'bbc-a11y`, git: 'git@github.com:mattwynne/bbc-a11y.git'
    ~~~

## How to use

Enter the URL for the site you wish to test. Try `http://bbc.co.uk` and `http://godaddy.com` for examples.

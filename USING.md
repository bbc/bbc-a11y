# BBC A11y Using Guidelines

## Introduction

bbc-a11y is a node package that uses electron to run javascript tests. 
It may be used as a stand alone repo, or as part of a continuous integration 
process for an existing repo.

## How do I install a stand alone bbc-a11y?

To install a stand alone bbc-a11y you will need npm, karma, and an up-to-date 
clone of this repo.

### Prerequisites

If necessary, follow instructions for 
[installing Node.js and updating npm](https://docs.npmjs.com/getting-started/installing-node). 
Check this with:

    npm

Then ensure you have karma installed (needed for testing bbc-a11y is OK):
    
    npm install karma-mocha mocha diff
    
### Installing bbc-a11y

Create an up-to-date clone of the bbc-a11y github repo (electron branch) and cd
into the folder it is in. Then:

    npm install
    npm test
    ./bin/a11y.js http://www.bbc.co.uk

You can run bbc-a11y against any valid URL.

## How do I set up bbc-a11y as part of my project?

-- Coming soon

## Configuring a11y for your project

You will want to configure a11y with a set of instructions and URLs to run the checks against.

-- Coming soon


### Configuration options

Nobody's perfect. Use `skip_standard` in the configuration to opt-out of certain
checks.

-- Coming soon

A11y will skip any standards from whose name matches that string. Or you could
use `only_standard` when you want to focus your attention on just one problem:

-- Coming soon

### Running it

-- Coming soon

## Using a11y in build scripts

-- Coming soon

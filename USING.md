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
    
### Installing bbc-a11y

1. Clone the repository: ``` $ git clone -b electron https://github.com/bbc/bbc-a11y.git ```
2. Change directory to the clone ```$ cd cd bbc-a11y/ ```
3. Install the tool ``` $ npm install ```
4. Run the tests to ensure all is installed well ``` $ npm test ``` (note: you will need to quit this process with CTRL+C to close it)
5. Run the tool against a URL: ``` ./bin/a11y.js http://www.bbc.co.uk ``` replacing 'http://www.bbc.co.uk' with the URL you wish to test.

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

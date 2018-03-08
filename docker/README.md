## bbc-a11y-docker

A Docker image containing [bbc-a11y](https://github.com/bbc/bbc-a11y) and all the necessary packages.

You can use this when you want to run bbc-a11y from a machine on which you can't install node.js or electron, for whatever reason (such as insufficient priveleges or incompatibility).

For example, electron is not easy to install on CentOS, so if you are using CentOS build agents in your continuous integration environment, this may be useful to you.

### Usage

Test a single page:

```
docker run --rm --tty bbca11y/bbc-a11y-docker http://www.bbc.co.uk/news/0
```

Or run tests from a config file:

```
docker run --rm --tty --volume $PWD:/ws bbca11y/bbc-a11y-docker --config /ws/a11y.js
```

### Credits

Thanks to [Joseph Wynn](https://github.com/wildlyinaccurate) for the initial version.

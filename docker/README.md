## bbc-a11y-docker

A Docker image containing [bbc-a11y](https://github.com/bbc/bbc-a11y) and all the necessary packages.

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

Thanks to [Joseph Wynne](https://github.com/wildlyinaccurate) for the initial version.

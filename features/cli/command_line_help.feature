Feature: Command Line Help

  Scenario: Asking the command line tool for help
    When I run `bbc-a11y --help`
    Then (ignoring whitespace) it should pass with:
    """
    Usage: bbc-a11y [options] <urls>

    Options:
      -V, --version              output the version number
      -i, --interactive          show browser window and leave open for debugging
      -m, --manual               include manual tests
      -w, --width <pixels>       override viewport width
      -c, --config <config>      path to config file
      -r, --reporter <reporter>  json or [path to custom reporter module]
      --coverage <list|table>    lists all tests with a description of each test
      -h, --help                 output usage information
    """

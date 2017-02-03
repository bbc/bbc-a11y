Feature: Command Line Help

  Scenario: Asking the command line tool for help
    When I run `bbc-a11y --help`
    Then it should pass with:
    """
      Usage: bbc-a11y [options] <urls>

      Options:

        -h, --help                 output usage information
        -V, --version              output the version number
        -i, --interactive          show browser window and leave open for debugging
        -w, --width <pixels>       override viewport width
        -c, --config <config>      path to config file
        -r, --reporter <reporter>  json or [path to custom reporter module]
    """

Feature: Provide muting tips

  To make it easy to configure mute rules, when you see failures, you'll also
  see some JSON snippets that suggest how to add configuration to mute the
  warning.

  Scenario: Generate a warning where there are several bad elements
    # Given a page with the body:
    #   """
    #   <div id="my-amazing-code">
    #     <h1>I am wonderfull</h1>
    #   </div>
    #   <h1>Bad stuff here. Ignore me.</h1>
    #   """
    # When I validate the exactly one main heading standard, with muting hints enabled
    # Then it fails with the message:
    #   """
    #   To mute these errors, add the following configuration:
    #
    #   {
    #     "mute": [
    #       "exactly-one-main-heading"
    #     ]
    #   }
    #   """

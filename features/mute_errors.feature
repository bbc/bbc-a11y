Feature: Mute errors

  Things like ORB and Barlesque that we don't control will clutter up our pages
  with violations.

  We need a way to ignore these kinds of problems, so
  we can focus on the problems that we can actually fix.

  Questions:

  - how can we ignore / remove specific areas of the page? What are some
    real examples?

  Scenario: Mute any errors from a specific standard
    # Given a page with the body:
    #   """
    #   <p>yo</p>
    #   """
    # When I validate the "Headings: exactly one main heading" standard
    # Then it fails with the message:
    #   """
    #   Found 0 h1 elements.
    #   """
    # When I add a configuration with:
    #   """
    #     mute: [
    #       "exactly-one-main-heading"
    #     ]
    #   """
    # And I validate the "exactly one main heading" standard
    # Then it shows 0 errors, 1 muted
    # And it passes

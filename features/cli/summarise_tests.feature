Feature: Summarise Tests

  Scenario: Printing a summary of tests
    When I run `bbc-a11y --summary`
    And it should pass with:
      """
      Tests covered by bbc-a11y:

      Section: Core purpose
      Name: Core purpose must be defined
      Type: manual
      Fail: for each page whose core purpose (to inform, educate, or entertain) is not clearly defined

      Section: Colour and meaning
      Name: Information conveyed with colour must also be identifiable from context or markup.
      Type: manual
      Fail: for each element whose information conveyed with colour is not also identifiable from context or markup.
      """

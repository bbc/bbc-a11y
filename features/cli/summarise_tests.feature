Feature: Summarise Tests

  Scenario: Printing a summary of tests
    When I run `bbc-a11y --summary`
    And it should pass with:
      """
      Tests covered by bbc-a11y:

      Name: Core purpose: Core purpose must be defined
      Type: manual
      Fails for each page whose core purpose (to inform, educate, or entertain) is not clearly defined

      Name: Colour and meaning: Information conveyed with colour must also be identifiable from context or markup.
      Type: manual
      Fails for each element whose information conveyed with colour is not also identifiable from context or markup.
      """

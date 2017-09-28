Feature: Summarise Tests

  Scenario: Printing a summary of tests
    When I run `bbc-a11y --summary`
    And it should pass with:
      """
      Tests covered by bbc-a11y:

      Core purpose: Core purpose must be defined
      Type: manual
      Fails for each page whose core purpose (to inform, educate, or entertain) is not clearly defined

      Colour and meaning: Information conveyed with colour must also be identifiable from context or markup
      Type: manual
      Fails for each page whose information conveyed with colour is not also identifiable from context or markup

      Colour contrast: Colour combinations must pass the WCAG colour contrast check
      Type: manual
      Fails for each page whose colour combinations fail the WCAG colour contrast check
      """

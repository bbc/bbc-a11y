Feature: Summarise Tests

  Scenario: Printing a summary of tests
    When I run `bbc-a11y --summary`
    And it should pass with:
      """
      Tests covered by bbc-a11y:

      Minimum text size: Text cannot be too small
      Type: automated
      Fails for each text node with a computed font size of less than 11px

      Principles: All documents must have a W3C recommended doctype
      Type: automated
      Fails for each page that is missing a w3c recommended doctype (e.g. <!DOCTYPE html>)

      Principles: Markup must validate against doctype
      Type: automated
      Fails for each page whose markup does not validate against a w3c standards validator

      Principles: Anchors must have hrefs
      Type: automated
      Fails for each visible <a> element with no href attribute

      Audio & Video: Alternatives for audio and visual content: Alternative delivery for embedded media must be provided
      Type: manual
      Fails for each page that includes embedded media with no alternative delivery
      """

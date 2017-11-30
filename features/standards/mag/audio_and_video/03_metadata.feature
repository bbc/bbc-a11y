Feature: Metadata

  Relevant metadata should be provided for all media.

  Metadata, information about an item, can help people to find what they
  require. Metadata provided with media content can help users understand the
  media and locate alternative versions.

  Relevant metadata might include duration, and the presence of subtitles,
  sign language, or audio description.

  Background:
    Given I am performing a manual test of the "Audio & Video: Metadata: Relevant metadata should be provided for all media" standard
    And I have been asked "Is relevant metadata provided for all media?"

  @html @manual
  Scenario: Manual pass
    When I answer "Yes"
    Then the manual test passes

  @html @manual
  Scenario: Manual fail
    When I answer "No"
    Then the manual test fails

Feature: Alternatives for audio and visual content

  Alternative delivery, such as subtitles, sign language, audio description and
  transcripts, must be provided with embedded media when available.

  Some users may not be able to hear audible content. Some users may not be able
  to see visual content. Having an alternative delivery, in addition to the
  media that can be perceived, supports comprehension. Multiple delivery formats
  also help cognitively impaired users.

  This guideline applies to all forms of audio and visual content, regardless of
  length or format, as appropriate for the content:

  * Subtitles must be provided where feasible, when they were included with a
    pre-recorded broadcast, or if content is for public facing corporate
    communications, employment or suppliers;

  * Audio described or sign language versions must be provided if they were
    included with an original broadcast;

  * For interactive content, such as games, narrative and instructions must be
    available both visually and audibly, for example using subtitles;

  * In addition to other alternative delivery, transcripts can be provided for
    all types of audio and visual content.

  Background:
    Given I am performing a manual test of the "Audio & Video: Alternatives for audio and visual content: Alternative delivery for embedded media must be provided" standard
    And I have been asked "Is alternative delivery (such as subtitles, sign language, audio description and transcripts) provided with all embedded media?"

  @html @manual
  Scenario: Manual pass
    When I answer "Yes"
    Then the manual test passes

  @html @manual
  Scenario: Manual fail
    When I answer "No"
    Then the manual test fails

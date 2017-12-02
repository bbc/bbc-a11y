Feature: Progressive functionality

  Apps and websites must be built to work in a progressive manner that ensures a
  functional experience for all users.

  Lower end and older mobile devices may have poor support for the latest
  software and hardware features, or a device may be experiencing network
  issues. Additionally, users may have some features disabled, including users
  of assistive technology and those on secured networks.

  Building apps and websites in a progressive manner means dynamically changing
  a basic experience when new features are detected that can enhance the
  experience. For some content, such as video or games that require Javascript,
  it may be necessary to provide a message explaining to the user what is
  required and linking to alternative content.

  HTML Applicability
  ==================

  * The main language of the page **must** be specified.
  * Changes to language within the page **must** be indicated.

  Assistive technologies such as screen readers have support for different
  languages, allowing for appropriate pronunciation.

  Controls that have no purpose without JavaScript **must not** be added to the
  page before the associated code is available capable of running.

  When there is no core (non-JavaScript) interaction then the control must not
  be added to the document before the associated JavaScript is capable of
  running as this would lead to controls that apparently do nothing, potentially
  causing confusion to users.

  @html @manual
  Scenario: Scripts and dynamic content built in a progressive manner (manual pass)
    Given I am performing a manual test of the "Scripts and dynamic content: Progressive functionality: Scripts and dynamic content must be built in a progressive manner" standard
    And I have been asked "Are scripts and dynamic content added in a progressive manner?"
    When I answer "Yes (or not applicable)"
    Then the manual test passes

  @html @manual
  Scenario: Scripts and dynamic content not built in a progressive manner (manual fail)
    Given I am performing a manual test of the "Scripts and dynamic content: Progressive functionality: Scripts and dynamic content must be built in a progressive manner" standard
    And I have been asked "Are scripts and dynamic content added in a progressive manner?"
    When I answer "No"
    Then the manual test fails

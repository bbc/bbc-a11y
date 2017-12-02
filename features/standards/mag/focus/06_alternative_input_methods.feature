Feature: Alternative input methods

  Alternative input methods must be supported.

  Some users do not use the input control provided with a device, such as the
  touch screen, or mouse. Instead, they may use a switch device, keyboard or
  braille display.

  Alternative methods of input and navigation that work with the platform must
  be supported to facilitate the needs of the user.

  Interactive content must not rely on a single input method. For example, a
  carousel must not support only touch interaction, it must also support
  alternative inputs via visible focusable elements.

  Background:
    Given I am performing a manual test of the "Focus: Alternative input methods: Alternative input methods must be supported" standard
    And I have been asked "Are alternative input methods, such as keyboard or voice, supported?"

  @html @manual
  Scenario: Alternative input methods supported (manual pass)
    When I answer "Yes"
    Then the manual test passes

  @html @manual
  Scenario: Alternative input methods unsupported (manual fail)
    When I answer "No"
    Then the manual test fails

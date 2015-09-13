Feature: HTML Validation


  Scenario: Submit to W3C validation Service

    When I submit the page to the W3C Markup Validation Service
    Then there should be no errors

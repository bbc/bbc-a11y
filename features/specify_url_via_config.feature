Feature: Specify URL via config

  Scenario: Specify a single page
    Given a standards-compliant website running at http://localhost:54321
    And a file named ".a11y.rb" with:
      """
      BBC::A11y.configure do
        page "http://localhost:54321/perfect.html"
      end
      """
    When I run `a11y`
    Then it should pass with:
      """
      BBC Accesibility: http://localhost:54321/perfect.html
      -----------------------------------------------------
      """

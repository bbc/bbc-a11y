Feature: Setting up the browser window

  Providing a `visit` function that returns a promise, allows complete control
  over navigation. Validation begins after the promise is resolved.

  Scenario: Filling in a login box before running tests
    Given a website running on a11ytests.com
    And a file named "a11y.js" with:
      """
      page('Members area (after logging in)', {
        visit: function (frame) {
          frame.src = 'https://a11ytests.com/perfect_after_login'
          return new Promise(function (test) {
            frame.onload = function () {
              var loginPage = frame.contentDocument
              loginPage.getElementById('username').value = 'admin'
              loginPage.getElementById('password').value = 'donut'
              loginPage.getElementById('loginButton').click()
              frame.onload = test
            }
          })
        }
      })
      """
    When I run `bbc-a11y`
    Then it should pass with:
      """
      ✓ Members area (after logging in)

      1 page checked, 0 errors found, 0 warnings, 0 standards skipped
      """

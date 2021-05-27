Feature: Setting Cookies

  Scenario: Setting a cookie before visiting a page
    Given a website running at http://localhost:54321
    And a file named "a11y.js" with:
      """
      page("http://localhost:54321/good_with_cookie.html", {
        cookies: [
          { name: 'open', value: 'sesame' }
        ]
      })
      page("http://localhost:54321/good_with_cookie.html", {
        cookies: [
          { name: 'open', value: 'wrong' }
        ]
      })
      page("http://localhost:54321/good_with_cookie.html")
      page("http://localhost:54321/good_with_cookie.html", {
        cookies: [
          { name: 'open', value: 'sesame' }
        ]
      })
      """
    When I run `bbc-a11y`
    Then it should fail with:
      """
      ✓ http://localhost:54321/good_with_cookie.html

      ✗ http://localhost:54321/good_with_cookie.html
        * Structure: Containers and landmarks: Exactly one main landmark
          - Found 0 main elements (main or with role="main").

      ✗ http://localhost:54321/good_with_cookie.html
        * Structure: Containers and landmarks: Exactly one main landmark
          - Found 0 main elements (main or with role="main").

      ✓ http://localhost:54321/good_with_cookie.html
      """

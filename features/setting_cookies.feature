Feature: Setting Cookies

  Scenario: Setting a cookie before visiting a page
    Given a website running on a11ytests.com
    And a file named "a11y.js" with:
      """
      page("https://a11ytests.com/good_with_cookie", {
        cookies: [
          { name: 'open', value: 'sesame' }
        ]
      })
      page("https://a11ytests.com/good_with_cookie", {
        cookies: [
          { name: 'open', value: 'wrong' }
        ]
      })
      page("https://a11ytests.com/good_with_cookie")
      page("https://a11ytests.com/good_with_cookie", {
        cookies: [
          { name: 'open', value: 'sesame' }
        ]
      })
      """
    When I run `bbc-a11y`
    Then it should fail with:
      """
      ✓ https://a11ytests.com/good_with_cookie

      ✗ https://a11ytests.com/good_with_cookie
        * Structure: Containers and landmarks: Exactly one main landmark
          - Found 0 elements with role="main".

      ✗ https://a11ytests.com/good_with_cookie
        * Structure: Containers and landmarks: Exactly one main landmark
          - Found 0 elements with role="main".

      ✓ https://a11ytests.com/good_with_cookie
      """

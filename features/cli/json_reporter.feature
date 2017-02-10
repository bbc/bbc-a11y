Feature: JSON Reporter
  Scenario: Reporting results in generic JSON format
    Given a website running at http://localhost:54321
    And a file named "a11y.js" with:
      """
      page("http://localhost:54321/perfect.html")
      page("http://localhost:54321/missing_main_heading.html")
      """
    When I run `bbc-a11y --reporter json`
    Then it should fail with exactly:
      """
      {
        "pagesChecked": 2,
        "errorsFound": 1,
        "errorsHidden": 0,
        "standardsSkipped": 0,
        "pages": [
          {
            "url": "http://localhost:54321/perfect.html",
            "result": {
              "results": [
                {
                  "standard": {
                    "section": "Focusable controls",
                    "name": "Anchors must have hrefs"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Form interactions",
                    "name": "Forms must have submit buttons"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Form labels",
                    "name": "Fields must have labels or titles"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Headings",
                    "name": "Content must follow headings"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Headings",
                    "name": "Exactly one main heading"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Headings",
                    "name": "Headings must be in ascending order"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Image alternatives",
                    "name": "Images must have alt attributes"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Indicating language",
                    "name": "Html must have lang attribute"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Main landmark",
                    "name": "Exactly one Main landmark"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Minimum text size",
                    "name": "Text cannot be too small"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Tab index",
                    "name": "Zero Tab index must only be set on elements which are focusable by default"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Title attributes",
                    "name": "Title attributes must not duplicate content"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Title attributes",
                    "name": "Title attributes only on inputs"
                  },
                  "errors": [],
                  "hiddenErrors": []
                }
              ],
              "skipped": []
            }
          },
          {
            "url": "http://localhost:54321/missing_main_heading.html",
            "result": {
              "results": [
                {
                  "standard": {
                    "section": "Focusable controls",
                    "name": "Anchors must have hrefs"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Form interactions",
                    "name": "Forms must have submit buttons"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Form labels",
                    "name": "Fields must have labels or titles"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Headings",
                    "name": "Content must follow headings"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Headings",
                    "name": "Exactly one main heading"
                  },
                  "errors": [
                    [
                      "Found 0 h1 elements."
                    ]
                  ],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Headings",
                    "name": "Headings must be in ascending order"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Image alternatives",
                    "name": "Images must have alt attributes"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Indicating language",
                    "name": "Html must have lang attribute"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Main landmark",
                    "name": "Exactly one Main landmark"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Minimum text size",
                    "name": "Text cannot be too small"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Tab index",
                    "name": "Zero Tab index must only be set on elements which are focusable by default"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Title attributes",
                    "name": "Title attributes must not duplicate content"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Title attributes",
                    "name": "Title attributes only on inputs"
                  },
                  "errors": [],
                  "hiddenErrors": []
                }
              ],
              "skipped": []
            }
          }
        ]
      }

      """

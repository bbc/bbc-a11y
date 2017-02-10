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
                    "section": "Focusable Controls",
                    "name": "Anchors must have hrefs"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Form Interactions",
                    "name": "Forms must have submit buttons"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Form Labels",
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
                    "section": "Image Alternatives",
                    "name": "Images must have alt attributes"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Indicating Language",
                    "name": "Html must have lang attribute"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Main Landmark",
                    "name": "Exactly one main landmark"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Minimum Text Size",
                    "name": "Text cannot be too small"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Tab Index",
                    "name": "Zero tab index must only be set on elements which are focusable by default"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Title Attributes",
                    "name": "Title attributes must not duplicate content"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Title Attributes",
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
                    "section": "Focusable Controls",
                    "name": "Anchors must have hrefs"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Form Interactions",
                    "name": "Forms must have submit buttons"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Form Labels",
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
                    "section": "Image Alternatives",
                    "name": "Images must have alt attributes"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Indicating Language",
                    "name": "Html must have lang attribute"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Main Landmark",
                    "name": "Exactly one main landmark"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Minimum Text Size",
                    "name": "Text cannot be too small"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Tab Index",
                    "name": "Zero tab index must only be set on elements which are focusable by default"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Title Attributes",
                    "name": "Title attributes must not duplicate content"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Title Attributes",
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

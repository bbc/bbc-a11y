Feature: JSON Reporter
  Scenario: Reporting results in generic JSON format
    Given a website running at http://localhost:54321
    And a file named "a11y.js" with:
      """
      page("http://localhost:54321/perfect.html")
      page("http://localhost:54321/missing_main_heading.html")
      """
    When I run `bbc-a11y --reporter=json`
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
                    "section": "focusableControls",
                    "name": "Anchors must have hrefs"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "formInteractions",
                    "name": "Forms must have submit buttons"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "formLabels",
                    "name": "Fields must have labels or titles"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "headings",
                    "name": "Content must follow headings"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "headings",
                    "name": "Exactly one main heading"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "headings",
                    "name": "Headings must be in ascending order"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "imageAlternatives",
                    "name": "Images must have alt attributes"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "indicatingLanguage",
                    "name": "Html must have lang attribute"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "mainLandmark",
                    "name": "Exactly one main landmark"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "minimumTextSize",
                    "name": "Text cannot be too small"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "tabIndex",
                    "name": "Elements with zero tab index must be fields"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "titleAttributes",
                    "name": "Title attributes must not duplicate content"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "titleAttributes",
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
                    "section": "focusableControls",
                    "name": "Anchors must have hrefs"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "formInteractions",
                    "name": "Forms must have submit buttons"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "formLabels",
                    "name": "Fields must have labels or titles"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "headings",
                    "name": "Content must follow headings"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "headings",
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
                    "section": "headings",
                    "name": "Headings must be in ascending order"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "imageAlternatives",
                    "name": "Images must have alt attributes"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "indicatingLanguage",
                    "name": "Html must have lang attribute"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "mainLandmark",
                    "name": "Exactly one main landmark"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "minimumTextSize",
                    "name": "Text cannot be too small"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "tabIndex",
                    "name": "Elements with zero tab index must be fields"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "titleAttributes",
                    "name": "Title attributes must not duplicate content"
                  },
                  "errors": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "titleAttributes",
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

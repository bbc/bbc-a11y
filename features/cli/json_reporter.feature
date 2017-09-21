Feature: JSON Reporter
  Scenario: Reporting results in generic JSON format
    Given a website running at http://localhost:54321
    And a file named "a11y.js" with:
      """
      page("http://localhost:54321/perfect.html", {
        skip: ["Main landmark: Exactly one Main landmark"]
      })
      page("http://localhost:54321/missing_main_heading.html")
      """
    When I run `bbc-a11y --reporter json`
    Then it should fail with exactly:
      """
      {
        "pagesChecked": 2,
        "errorsFound": 1,
        "errorsHidden": 0,
        "standardsSkipped": 1,
        "pages": [
          {
            "url": "http://localhost:54321/perfect.html",
            "result": {
              "results": [
                {
                  "standard": {
                    "section": "Core purpose",
                    "name": "Core purpose must be defined"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Colour and meaning",
                    "name": "Information conveyed with colour must also be identifiable from context or markup."
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Colour contrast",
                    "name": "Colour combinations must pass the WCAG colour contrast check"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Control styles",
                    "name": "Editorial links must be self-evident"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Control styles",
                    "name": "Text links must have mouse over state change"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Focusable controls",
                    "name": "Anchors must have hrefs"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Focus styles",
                    "name": "Focused elements must be identifiable"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Form interactions",
                    "name": "Forms must have submit buttons"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Form labels",
                    "name": "Fields must have labels or titles"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Headings",
                    "name": "Content must follow headings"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Headings",
                    "name": "Exactly one main heading"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Headings",
                    "name": "Headings must be in ascending order"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Image alternatives",
                    "name": "Images must have alt attributes"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Indicating language",
                    "name": "Html must have lang attribute"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Minimum text size",
                    "name": "Text cannot be too small"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Progressive enhancement",
                    "name": "Document must not require JavaScript or CSS to function"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Resizable text",
                    "name": "Content must be visible and usable with page zoomed to 200% of normal"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Resizable text",
                    "name": "Content must be visible and usable with text resized to 200% of normal"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Resizable text",
                    "name": "Text must be styled with units that are resizable in all browsers"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Page titles",
                    "name": "Title element must identify main content"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Tab index",
                    "name": "Zero Tab index must only be set on elements which are focusable by default"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Tables",
                    "name": "Use tables for data"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Title attributes",
                    "name": "Title attributes must not duplicate content"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Title attributes",
                    "name": "Title attributes only on inputs"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Validation",
                    "name": "All documents must have a W3C recommended doctype"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Validation",
                    "name": "Markup must validate against doctype"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Visible on focus",
                    "name": "Elements must be visible on focus"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                }
              ],
              "skipped": [
                {
                  "section": "Main landmark",
                  "name": "Exactly one Main landmark"
                }
              ],
              "errorsFound": 0
            }
          },
          {
            "url": "http://localhost:54321/missing_main_heading.html",
            "result": {
              "results": [
                {
                  "standard": {
                    "section": "Core purpose",
                    "name": "Core purpose must be defined"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Colour and meaning",
                    "name": "Information conveyed with colour must also be identifiable from context or markup."
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Colour contrast",
                    "name": "Colour combinations must pass the WCAG colour contrast check"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Control styles",
                    "name": "Editorial links must be self-evident"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Control styles",
                    "name": "Text links must have mouse over state change"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Focusable controls",
                    "name": "Anchors must have hrefs"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Focus styles",
                    "name": "Focused elements must be identifiable"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Form interactions",
                    "name": "Forms must have submit buttons"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Form labels",
                    "name": "Fields must have labels or titles"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Headings",
                    "name": "Content must follow headings"
                  },
                  "errors": [],
                  "warnings": [],
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
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Headings",
                    "name": "Headings must be in ascending order"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Image alternatives",
                    "name": "Images must have alt attributes"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Indicating language",
                    "name": "Html must have lang attribute"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Main landmark",
                    "name": "Exactly one Main landmark"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Minimum text size",
                    "name": "Text cannot be too small"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Progressive enhancement",
                    "name": "Document must not require JavaScript or CSS to function"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Resizable text",
                    "name": "Content must be visible and usable with page zoomed to 200% of normal"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Resizable text",
                    "name": "Content must be visible and usable with text resized to 200% of normal"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Resizable text",
                    "name": "Text must be styled with units that are resizable in all browsers"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Page titles",
                    "name": "Title element must identify main content"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Tab index",
                    "name": "Zero Tab index must only be set on elements which are focusable by default"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Tables",
                    "name": "Use tables for data"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Title attributes",
                    "name": "Title attributes must not duplicate content"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Title attributes",
                    "name": "Title attributes only on inputs"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Validation",
                    "name": "All documents must have a W3C recommended doctype"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Validation",
                    "name": "Markup must validate against doctype"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                },
                {
                  "standard": {
                    "section": "Visible on focus",
                    "name": "Elements must be visible on focus"
                  },
                  "errors": [],
                  "warnings": [],
                  "hiddenErrors": []
                }
              ],
              "skipped": [],
              "errorsFound": 1
            }
          }
        ]
      }

      """

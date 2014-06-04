Feature: HTML Validation

  All documents **must** have a [W3C recommended Doctype](http://www.w3.org/QA/2002/04/valid-dtd-list.html) and 
  all Markup **must** validate against that Doctype.
  
  Rationale
  =========
  
  While assistive technologies such as screen readers generally do a good job of interpreting invalid HTML 
  there will be less risk of problems arising if the document follows a recognised standard Doctype.
  
  Techniques
  ==========

  Pass:

      <!DOCTYPE html>¬
      <html lang="en-GB">
  
  Fail:

      <html lang="en-GB">
  
  Notes
  ====

  Primarily we'll be testing against HTML5, but it's worded in this way to avoid the situation that we have 
  with the current standards which unintentionally make XHTML the only passing doctype. In theory HTML should 
  be unversioned going forward but who knows what will happen in 5 years time.

  Scenario: Submit to W3C validation Service

    See http://validator.w3.org

    When I submit the page to the W3C Markup Validation Service
    Then there should be no errors
# HTML Validation

  All documents **must** have a [W3C recommended Doctype](http://www.w3.org/QA/2002/04/valid-dtd-list.html) and
  all Markup **must** validate against that Doctype.

###  Rationale
  =========

  While assistive technologies such as screen readers generally do a good job of interpreting
  invalid HTML there will be less risk of problems arising if the document follows a recognised
  standard Doctype.

###  Techniques
  ==========

  Pass:

      <!DOCTYPE html>
      <html lang="en-GB">

  Fail:

      <html lang="en-GB">

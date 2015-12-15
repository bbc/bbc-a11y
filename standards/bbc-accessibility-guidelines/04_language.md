# Content language

  The main language of the page _must_ be specified.

  Changes to language within the page **must** be indicated.

  Rationale
  =========

  Assistive technologies such as screen readers have support for different languages,
  allowing for appropriate pronunciation.

  Techniques
  ==========

  Pass:

  ```
  <!DOCTYPE html>
  <html lang="en-GB">
  <head>
    <title>Language techniques</title>
  </head>
  <body>
    <h1>Techniques for language in HTML</h1>
    <p><span lang="es">Cinco de Mayo</span> is Spanish for "fifth of May"</p>
  </body>
  </html>
  ```

  Fail:

  ```
  <!DOCTYPE html>
  <html>
  <head>
    <title>Language techniques</title>
  </head>
  <body>
    <h1>Techniques for language in HTML</h1>
    <p>Cinco de Mayo is Spanish for "fifth of May"</p>
  </body>
  </html>
  ```

module.exports = {
  name: 'Colour combinations must pass the WCAG colour contrast check',

  test: function ($, fail, warn, pageConfiguration, ask) {
    return ask('Do all colour combinations pass the <a target="_blank" href="https://snook.ca/technical/colour_contrast/colour.html">Snook colour contrast check</a>?')
      .catch(function (error) {
        fail(error)
      })
  }
}

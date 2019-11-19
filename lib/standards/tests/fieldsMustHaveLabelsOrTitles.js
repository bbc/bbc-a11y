module.exports = {
  name: 'Fields must have labels or titles',

  type: 'automated',

  failsForEach: [
    'visible input element (<input>, <textarea> and <select>) with no title ' +
    "attribute or <label> element referring to it (in the label's for attribute)",
    '<button> element with no text (or only whitespace as text) without an aria-label'
  ],

  test: function ({ $, fail }) {
    $("input:visible:not([title], [type='hidden'], [type='submit'], [type='reset'], [type='image']), " +
      'textarea:visible:not([title]), select:visible:not([title])')
      .filter(function (index, field) {
        return !hasIdOrLabel($(field))
      })
      .each(function (index, element) {
        fail('Field has no label or title attribute:', element)
      })

    $('button')
      .filter(function (index, field) {
        return !hasText($(field))
      })
      .each(function (index, field) {
        const $field = $(field)

        if (hasBackgroundImage($field)) {
          if (!hasAriaLabel($field)) {
            fail('Image button has no aria-label:', field)
          }
        } else {
          fail('Button has no text:', field)
        }
      })
  }
}

function stringHasCharacters (string) {
  return Boolean(string && string.trim().length)
}

function hasText (field) {
  return stringHasCharacters(field.text())
}

function hasBackgroundImage (field) {
  const backgroundImage = field.css('background-image')
  return stringHasCharacters(backgroundImage) && backgroundImage !== 'none'
}

function hasAriaLabel (field) {
  return stringHasCharacters(field.attr('aria-label'))
}

function hasIdOrLabel (field) {
  return hasId(field) || hasLabel(field)
}

function hasId (field) {
  return field.is('[id]')
}

function hasLabel (field) {
  var selector = "label[for='" + field.attr('id') + "']"
  return field.parents('body').find(selector).length > 0
}

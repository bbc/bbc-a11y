module.exports = {
  name: 'Fields must have labels or titles',

  type: 'automated',

  failsForEach: [
    'visible input element (<input>, <textarea> and <select>) with no title ' +
      "attribute or <label> element referring to it (in the label's for attribute)",
    '<button> element with no text (or only whitespace as text)'
  ],

  test: function ({ $, fail }) {
    $(
      "input:visible:not([title], [type='hidden'], [type='submit'], [type='reset'], [type='image']), " +
        'textarea:visible:not([title]), select:visible:not([title])'
    ).each(function (index, field) {
      const $field = $(field)

      if (!hasId($field) || !hasLabel($field)) {
        fail('Field has no label or title attribute:', field)
      }
    })

    $('input[type="image"]').each(function (index, field) {
      const fieldSrc = $(field).attr('src')
      const fieldAlt = $(field).attr('alt')

      if (Boolean(fieldSrc && fieldSrc.trim()) === false) {
        fail('Field with type of image has no src:', field)
      }
      if (Boolean(fieldAlt && fieldAlt.trim()) === false) {
        fail('Field with type of image has no alt text:', field)
      }
    })

    $('button')
      .filter(function (index, button) {
        const buttonHasNoText = $(button).text().trim() === ''
        return buttonHasNoText
      })

      .filter(function (index, button) {
        const buttonHasNoAriaLabel = hasAriaLabel($(button)) === false
        return buttonHasNoAriaLabel
      })
      .filter(function (index, button) {
        const buttonHasNoAriaLabelledBy =
          hasAriaLabelledBy($(button)) === false
        return buttonHasNoAriaLabelledBy
      })
      .filter(function (index, button) {
        const buttonHasInlineImage = hasInlineImage($(button))
        const buttonHasBackgroundImage = hasBackgroundImage($(button))

        if (buttonHasInlineImage) {
          const imageAlt = $(button).find('img').attr('alt')

          if (Boolean(imageAlt && imageAlt.trim()) === false) {
            fail(
              'Button with no text with an inline image has no alt text:',
              button
            )
          }
          return false
        }
        if (buttonHasBackgroundImage) {
          return true
        } else {
          fail('Button has no text or image:', button)
          return false
        }
      })
      .each(function (index, element) {
        fail(
          'Button with inline image or background image has no aria-label or aria-labelledby:',
          element
        )
      })
  }
}

function hasId (field) {
  return field.is('[id]')
}

function hasLabel (field) {
  var selector = "label[for='" + field.attr('id') + "']"
  return field.parents('body').find(selector).length > 0
}

function hasAriaLabel (field) {
  var ariaLabel = field.attr('aria-label')
  if (!ariaLabel) return false
  return ariaLabel.trim() !== ''
}

function hasAriaLabelledBy (field) {
  var ariaLabelledBy = field.attr('aria-labelledby')
  if (!ariaLabelledBy) return false
  return ariaLabelledBy.trim() !== ''
}

function hasInlineImage (field) {
  var inlineImage = field.find('img, svg')
  return Boolean(inlineImage.length)
}

function hasBackgroundImage (field) {
  const bgImage = field.css('background-image')
  if (!bgImage) return false
  if (bgImage === 'none') return false
  return bgImage.trim() !== ''
}

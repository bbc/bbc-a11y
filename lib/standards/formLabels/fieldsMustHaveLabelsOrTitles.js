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

module.exports = {
  name: 'Fields must have labels or titles',

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
      .filter(function (index, button) {
        return $(button).text().trim() === ''
      })
      .each(function (index, element) {
        fail('Button has no text:', element)
      })
  }
}

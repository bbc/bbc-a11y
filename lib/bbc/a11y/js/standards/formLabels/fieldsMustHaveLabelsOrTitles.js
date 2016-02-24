function hasIdOrLabel(field) {
  return hasId(field) || hasLabel(field);
}

function hasId(field) {
  return field.is('[id]')
}

function hasLabel(field) {
  var selector = "label[for='" + field.attr('id') + "']";
  return field.parents('body').find(selector).length > 0;
}

module.exports = {
  name: 'Fields must have labels or titles',

  validate: function($, fail) {
    $("input:not([type='hidden']):not([title]), " +
      "textarea:not([title]), " +
      "select:not([title])").each(function(index, field) {
      if (!hasIdOrLabel($(field))) {
        fail('Field has no label or title attribute:', field)
      }
    });
  }
}

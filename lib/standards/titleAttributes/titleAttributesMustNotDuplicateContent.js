module.exports = {
  name: 'Title attributes must not duplicate content',

  type: 'automated',

  failsForEach: 'element that has the same text content as the page <title>',

  test: function ({ $, fail }) {
    $('[title]:visible').each(function (index, element) {
      if ($(element).text().trim() === $(element).attr('title').trim()) {
        fail('Title attribute duplicates content:', element)
      }
    })
  }
}

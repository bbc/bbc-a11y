module.exports = {
  name: 'Title attributes must not duplicate content',

  validate: function($, fail) {
    $("[title]:visible").each(function(index, element) {
      if ($(element).text().trim() == $(element).attr('title').trim()) {
        fail("Title attribute duplicates content:", element)
      }
    });
  }
}

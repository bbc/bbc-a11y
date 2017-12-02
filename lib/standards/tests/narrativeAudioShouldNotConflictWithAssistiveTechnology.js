module.exports = {
  name: 'Narrative audio should not conflict with assistive technology',

  type: 'manual',

  failsForEach: 'page with narrative audio that conflicts with assistive technology',

  manualTest: {
    question: 'Does narrative audio in any interactive media conflict with native assistive technology?',
    passText: 'No (or not applicable)',
    failText: 'Yes'
  }
}

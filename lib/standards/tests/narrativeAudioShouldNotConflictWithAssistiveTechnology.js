module.exports = {
  name: 'Narrative audio should not conflict with assistive technology',

  type: 'manual',

  failsForEach: 'page with narrative audio that conflicts with assistive technology',

  manualTest: {
    question: 'Is assistive technology uninterrupted by narrative audio?'
  }
}

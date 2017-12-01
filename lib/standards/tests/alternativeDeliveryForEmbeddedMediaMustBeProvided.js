module.exports = {
  name: 'Alternative delivery for embedded media must be provided',

  type: 'manual',

  failsForEach: 'page that includes embedded media with no alternative delivery',

  manualTest: {
    question: 'Is alternative delivery (such as subtitles, sign language, audio ' +
      'description or transcripts) provided with all embedded media?',
    passText: 'Yes (or not applicable)'
  }
}

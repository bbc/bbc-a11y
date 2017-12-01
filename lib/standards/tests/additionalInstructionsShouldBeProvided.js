module.exports = {
  name: 'Additional instructions should be provided',

  type: 'manual',

  failsForEach: 'page that is missing a w3c recommended doctype (e.g. <!DOCTYPE html>)',

  manualTest: {
    question: 'Are suitable additional instructions provided to supplement visual and audio cues?',
    passText: 'Yes (or not applicable)'
  }
}

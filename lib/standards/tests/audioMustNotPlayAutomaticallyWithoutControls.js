module.exports = {
  name: 'Audio must not play automatically without controls',

  type: 'manual',

  failsForEach: 'audio that plays back without the user being aware or pause/stop/mute button provided',

  manualTest: {
    question: 'Does any audio that plays automatically make the user aware this will happen, or provide a pause/stop/mute button?',
    passText: 'Yes (or not applicable)'
  }
}

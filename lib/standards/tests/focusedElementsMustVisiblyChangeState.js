module.exports = {
  name: 'Focused elements must visibly change state',

  type: 'manual',

  failsForEach: 'page with actionable and focusable elements that do not have a visible state change',

  manualTest: {
    question: 'Do all actionable and focusable elements visibly change state when focused?'
  }
}

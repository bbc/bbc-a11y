module.exports = class NullWindowAdapter {
  constructor () {
    this.width = 640
    this.height = 480
  }

  getContentSize () {
    return {
      width: this.width,
      height: this.height
    }
  }

  setContentSize (width, height) {
    this.width = width
    this.height = height
  }

  measureInnerWidth () {
    return this.width
  }
}

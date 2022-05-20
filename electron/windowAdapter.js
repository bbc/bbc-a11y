const win = require('electron').remote.getCurrentWindow();

module.exports = class ElectronWindowAdapter {
  getContentSize() {
    const [width, height] = win.getContentSize();
    return { width, height };
  }

  setContentSize(width, height) {
    win.setContentSize(width, height, false);
  }

  measureInnerWidth() {
    return window.innerWidth;
  }
};

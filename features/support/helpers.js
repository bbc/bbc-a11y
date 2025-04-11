/* global requestAnimationFrame */

async function waitForElement (frame, selector, options = {}) {
  const { timeout = 2000, textContent } = options
  const startTime = Date.now()

  return new Promise((resolve, reject) => {
    function checkElement () {
      const element = frame.contentDocument.querySelector(selector)
      if (element && (!textContent || element.textContent.trim() === textContent)) {
        resolve(element)
      } else if (Date.now() - startTime > timeout) {
        reject(new Error(`Element matching selector "${selector}" ${textContent ? `with text "${textContent}"` : ''} not found within ${timeout}ms.`))
      } else {
        if (typeof requestAnimationFrame !== 'undefined') {
          requestAnimationFrame(checkElement)
        } else {
          setTimeout(checkElement, 50)
        }
      }
    }
    checkElement()
  })
}

async function waitForElementWithText (frame, selector, text, options = {}) {
  const { timeout = 2000 } = options
  const startTime = Date.now()

  return new Promise((resolve, reject) => {
    function checkElements () {
      const elements = Array.from(frame.contentDocument.querySelectorAll(selector))
      const foundElement = elements.find(el => el.textContent.trim() === text)

      if (foundElement) {
        resolve(foundElement)
      } else if (Date.now() - startTime > timeout) {
        const availableTexts = elements.map(el => `"${el.textContent.trim()}"`).join(', ')
        reject(new Error(`Element matching selector "${selector}" with text "${text}" not found within ${timeout}ms. Found elements with texts: [${availableTexts}]`))
      } else {
        if (typeof requestAnimationFrame !== 'undefined') {
          requestAnimationFrame(checkElements)
        } else {
          setTimeout(checkElements, 50)
        }
      }
    }
    checkElements()
  })
}

module.exports = {
  waitForElement,
  waitForElementWithText
}

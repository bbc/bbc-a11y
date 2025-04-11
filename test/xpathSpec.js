/* eslint-env mocha */
const xpath = require('../lib/results/xpath.js')
const expect = require('chai').expect
const $ = require('jquery')

describe('xpath', function () {
  describe('.replaceElementsWithXPaths()', function () {
    function createJQueryElement (tagName) {
      return $('<' + tagName + '/>').appendTo('body')
    }

    function createElement (tagName) {
      return createJQueryElement(tagName)[0]
    }

    beforeEach(function () {
      $('body').html('')
    })

    it('replaces element values with xpaths', function () {
      const values = [createElement('p'), createElement('b')]
      const replaced = xpath.replaceElementsWithXPaths(values)
      expect(replaced).to.eql([
        { xpath: '/html/body/p', element: values[0] },
        { xpath: '/html/body/b', element: values[1] }
      ])
    })

    it('replaces jquery values with xpaths', function () {
      const values = [createJQueryElement('p'), createJQueryElement('b')]
      const replaced = xpath.replaceElementsWithXPaths(values)
      expect(replaced).to.eql([
        { xpath: '/html/body/p', element: values[0][0] },
        { xpath: '/html/body/b', element: values[1][0] }
      ])
    })

    it('uses element id values for shorter xpaths', function () {
      const top = document.createElement('div')
      top.innerHTML = '<div id="a"><div id="b"><span class="x">ok <b>then</b></span></div></div>'
      const b = top.querySelector('b')

      const replaced = xpath.replaceElementsWithXPaths([b])
      expect(replaced).to.eql([{ element: b, xpath: "//div[@id='b']/span/b" }])
    })

    it('replaces non-element values with themselves', function () {
      const values = [1, 'two']
      const replaced = xpath.replaceElementsWithXPaths(values)
      expect(replaced).to.eql(values)
    })

    it('replaces elements in nested arrays', function () {
      const p = createElement('p')
      const b = createJQueryElement('b')
      const values = [1, [p], [[b]]]
      const replaced = xpath.replaceElementsWithXPaths(values)
      expect(replaced).to.eql([
        1,
        { xpath: '/html/body/p', element: p },
        { xpath: '/html/body/b', element: b[0] }
      ])
    })
  })
})

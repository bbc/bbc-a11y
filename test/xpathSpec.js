/* eslint-env mocha */
var xpath = require('../lib/xpath.js')
var expect = require('chai').expect
var $ = require('jquery')

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
      var values = [createElement('p'), createElement('b')]
      var replaced = xpath.replaceElementsWithXPaths(values)
      expect(replaced).to.eql([
        { xpath: '/html/body/p', element: values[0] },
        { xpath: '/html/body/b', element: values[1] }
      ])
    })

    it('replaces jquery values with xpaths', function () {
      var values = [createJQueryElement('p'), createJQueryElement('b')]
      var replaced = xpath.replaceElementsWithXPaths(values)
      expect(replaced).to.eql([
        { xpath: '/html/body/p', element: values[0][0] },
        { xpath: '/html/body/b', element: values[1][0] }
      ])
    })

    it('uses element id values for shorter xpaths', function () {
      var top = document.createElement('div')
      top.innerHTML = '<div id="a"><div id="b"><span class="x">ok <b>then</b></span></div></div>'
      var b = top.querySelector('b')

      var replaced = xpath.replaceElementsWithXPaths([b])
      expect(replaced).to.eql([{ element: b, xpath: "//div[@id='b']/span/b" }])
    })

    it('replaces non-element values with themselves', function () {
      var values = [1, 'two']
      var replaced = xpath.replaceElementsWithXPaths(values)
      expect(replaced).to.eql(values)
    })

    it('replaces elements in nested arrays', function () {
      var p = createElement('p')
      var b = createJQueryElement('b')
      var values = [1, [p], [[b]]]
      var replaced = xpath.replaceElementsWithXPaths(values)
      expect(replaced).to.eql([
        1,
        { xpath: '/html/body/p', element: p },
        { xpath: '/html/body/b', element: b[0] }
      ])
    })
  })
})

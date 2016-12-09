var xpath = require('../../../../lib/bbc/a11y/js/xpath.js');
var expect = require('chai').expect;
var $ = require('jquery');

describe('xpath', function() {
  describe('.replaceElementsWithXPaths()', function() {
    it('replaces element values with xpaths', function() {
      var values = [document.head, document.body];
      var replaced = xpath.replaceElementsWithXPaths(values);
      expect(replaced).to.eql(['/html/head', '/html/body']);
    });

    it('replaces jquery values with xpaths', function() {
      var values = [$(document.head), $(document.body)];
      var replaced = xpath.replaceElementsWithXPaths(values);
      expect(replaced).to.eql(['/html/head', '/html/body']);
    });

    it('uses element id values for shorter xpaths', function() {
      var top = document.createElement('div')
      top.innerHTML = '<div id="a"><div id="b"><span class="x">ok <b>then</b></span></div></div>'

      var replaced = xpath.replaceElementsWithXPaths([top.querySelector('b')]);
      expect(replaced).to.eql(["//div[@id='b']/span/b"]);
    });

    it('replaces non-element values with themselves', function() {
      var values = [1, 'two'];
      var replaced = xpath.replaceElementsWithXPaths(values);
      expect(replaced).to.eql(values);
    });

    it('replaces elements in nested arrays', function() {
      var values = [1, [document.body], [[$(document.head)]]];
      var replaced = xpath.replaceElementsWithXPaths(values);
      expect(replaced).to.eql([1, '/html/body', '/html/head']);
    });
  });
});

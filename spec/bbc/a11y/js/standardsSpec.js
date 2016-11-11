var standards = require('../../../../lib/bbc/a11y/js/standards.js');
var expect = require('chai').expect;

describe('standards', function() {
  describe('.matching(undefined)', function() {
    it('finds all standards', function() {
      var matches = standards.matching();
      expect(matches.standards.length).to.equal(standards.all.length);
    });
  });

  describe('.matching("Focusable Controls: Anchors must have hrefs")', function() {
    it('finds standards matching the string', function() {
      var matches = standards.matching('Focusable Controls: anchors must have hrefs');
      expect(matches.standards.length).to.equal(1);
    });
  });

  describe('.matching({ skip: ["Focusable Controls: Anchors must have hrefs"] })', function() {
    it('finds all standards except one', function() {
      var matches = standards.matching({ skip: ["Focusable Controls: Anchors must have hrefs"] });
      expect(matches.standards.length).to.equal(standards.all.length - 1);
    });
  });

  describe('.matching({ only: ["Focusable controls: Anchors must have hrefs"] })', function() {
    it('finds one standard', function() {
      var matches = standards.matching({ only: ["Focusable controls: Anchors must have hrefs"] });
      expect(matches.standards.length).to.equal(1);
    });
  });
});

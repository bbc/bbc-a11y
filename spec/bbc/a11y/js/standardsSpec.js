var standards = require('../../../../lib/bbc/a11y/js/standards.js');
var expect = require('chai').expect;

describe('standards', function() {
  describe('.matching(undefined)', function() {
    it('finds all standards', function() {
      var matches = standards.matching();
      expect(matches.standards.length).to.equal(standards.all.length);
    });
  });

  describe('.matching(string)', function() {
    it('finds standards matching the string', function() {
      var matches = standards.matching('anchors must have hrefs');
      expect(matches.standards.length).to.equal(1);
    });
  });

  describe('.matching({ skip: ["anchors must have hrefs"] })', function() {
    it('finds all standards except one', function() {
      var matches = standards.matching({ skip: ["anchors must have hrefs"] });
      expect(matches.standards.length).to.equal(standards.all.length - 1);
    });
  });

  describe('.matching({ only: "anchors must have hrefs" })', function() {
    it('finds one standard', function() {
      var matches = standards.matching({ only: "anchors must have hrefs" });
      expect(matches.standards.length).to.equal(1);
    });
  });
});

var a11y = require('../../../../lib/bbc/a11y/js/a11y.js');
var expect = require('chai').expect;
var $ = require('jquery');

describe('a11y validating in frames', function() {
  beforeEach(function() {
    $('body').html('<html><body><h1>Top level</h1><iframe src="about:blank"></iframe></body></html>');
    var doc = $('iframe')[0].contentWindow.document
    doc.open()
    doc.write('<html><body><h2>Second level</h2><iframe src="about:blank"></iframe><iframe src="about:blank"></iframe></body></html>')
    doc.close()
    var doc2 = doc.body.querySelectorAll('iframe')[0].contentWindow.document
    doc2.open()
    doc2.write('<html><body><h3>Third level<h3></body></html>')
    doc2.close()
    var doc3 = doc.body.querySelectorAll('iframe')[1].contentWindow.document
    doc3.open()
    doc3.write('<html><body><h3>Third level again<h3></body></html>')
    doc3.close()
  })

  it('validates in iframes', function() {
    var validation = a11y.validate({ only: ['Headings: Exactly one main heading']})
    expect(validation.results).to.eql([{
      standard: {
        section: 'headings',
        name: 'Exactly one main heading',
      },
      errors: [
        ['In frame', '/html/body/iframe', ':', 'Found 0 h1 elements.'],
        ['In frame', '/html/body/iframe', "/html/body/iframe[1]", ':', 'Found 0 h1 elements.'],
        ['In frame', '/html/body/iframe', "/html/body/iframe[2]", ':', 'Found 0 h1 elements.']
      ]
    }])
  });
});

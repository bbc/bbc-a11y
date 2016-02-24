var a11y = require('../../../../lib/bbc/a11y/js/a11y.js');
var expect = require('chai').expect;
var $ = require('jquery');

describe('a11y', function() {
  beforeEach(function() {
    $('body').html('');
  })

  it('validates the DOM', function() {
    var validation = a11y.validate();
    var errors = validation.results.filter(function(standardResult) {
      return standardResult.errors.length > 0;
    });
    var expectedErrors = [
      {
        "standard":"Exactly one main heading",
        "errors":[
          ["Found 0 h1 elements."]
        ]
      },
      {
        "standard":"Html must have lang attribute",
        "errors":[
          ["html tag has no lang attribute:","/html"]
        ]
      },
      {
        "standard":"Exactly one main landmark",
        "errors":[
          ['Found 0 elements with role="main".']
        ]
      }
    ];
    expect(JSON.stringify(errors)).to.equal(JSON.stringify(expectedErrors));
  });

  it('skips standards', function() {
    var validation = a11y.validate({ skip: ['Exactly one main landmark'] });
    expect(validation.skipped).to.eql(['Exactly one main landmark']);
  });
});

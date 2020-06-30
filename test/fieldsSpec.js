/* eslint-env mocha */
var a11y = require('../lib/a11y.js');
var expect = require('chai').expect;
var $ = require('jquery');

describe('Fields', function () {
  describe('Accessible fields', function () {
    describe('Input with a title', function () {
      var testNode = '<input title="input">';

      it('should not fail', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>');

        const outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles',
          ],
        });

        expect(outcome.results[0].errors).to.eql([]);
      });
    });

    describe('Image input with src and alt text', function () {
      var testNode = '<input type="image" src="next-icon.svg" alt="Next">';

      it('should not fail', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>');

        const outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles',
          ],
        });

        expect(outcome.results[0].errors).to.eql([]);
      });
    });

    describe('Input with a <label> element referring to it', function () {
      var testNode = '<label for="input">Label</label><input id="input">';

      it('should not fail', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>');
        var el = document.getElementsByTagName('input')[0];

        const outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles',
          ],
        });

        expect(outcome.results[0].errors).to.eql([]);
      });
    });

    describe('Button with no text with an inline image with an aria-label', function () {
      var testNode =
        '<button class="arrows__chevron" aria-label="Scroll carousel right"><img src="some-icon.png" /></button>';

      it('should not fail', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>');

        const outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles',
          ],
        });

        expect(outcome.results[0].errors).to.eql([]);
      });
    });

    describe('Button with no text with an inline image with an aria-labelledby', function () {
      var testNode =
        '<button aria-labelledby="my_label"><img src="some-icon.png" /></button>';

      it('should not fail', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>');

        const outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles',
          ],
        });

        expect(outcome.results[0].errors).to.eql([]);
      });
    });

    describe('Button with no text with a background image with an aria-label', function () {
      var testNode =
        '<button style="background-image: url(\'next-icon.svg\')" aria-label="Next"></button>';

      it('should not fail', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>');
        var el = document.getElementsByTagName('button')[0];

        const outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles',
          ],
        });

        expect(outcome.results[0].errors).to.eql([]);
      });
    });

    describe('Button with no text with a background image with an aria-labelledby', function () {
      var testNode =
        '<button style="background-image: url(\'next-icon.svg\')" aria-labelledby="Next"></button>';

      it('should not fail', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>');

        const outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles',
          ],
        });

        expect(outcome.results[0].errors).to.eql([]);
      });
    });
  });

  describe('Not accessible fields', function () {
    describe('Input element with no title', function () {
      var testNode = '<input>';

      it('should fail', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>');
        var el = document.getElementsByTagName('input')[0];

        const outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles',
          ],
        });

        expect(outcome.results[0].errors).to.eql([
          [
            'Field has no label or title attribute:',
            { xpath: '/html/body/input', element: el },
          ],
        ]);
      });
    });

    describe('Image input with no title', function () {
      var testNode = '<input type="image" alt="Next" />';

      it('should fail', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>');
        var el = document.getElementsByTagName('input')[0];

        const outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles',
          ],
        });

        expect(outcome.results[0].errors).to.eql([
          [
            'Field with type of image has no src:',
            { xpath: '/html/body/input', element: el },
          ],
        ]);
      });
    });

    describe('Image input with no alt text', function () {
      var testNode = '<input type="image" src="next-icon.svg" />';

      it('should fail', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>');
        var el = document.getElementsByTagName('input')[0];

        const outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles',
          ],
        });

        expect(outcome.results[0].errors).to.eql([
          [
            'Field with type of image has no alt text:',
            { xpath: '/html/body/input', element: el },
          ],
        ]);
      });
    });

    describe('Button with no text and no image', function () {
      var testNode = '<button class="arrows__chevron"></button>';

      it('should fail', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>');
        var el = document.getElementsByTagName('button')[0];

        const outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles',
          ],
        });

        expect(outcome.results[0].errors).to.eql([
          [
            'Button has no text or image:',
            { xpath: '/html/body/button', element: el },
          ],
        ]);
      });
    });

    describe('Button with no text and with an inline image with no aria-label or aria-labelledby', function () {
      var testNode =
        '<button class="arrows__chevron"><img src="some-icon.png" /></button>';

      it('should fail', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>');
        var el = document.getElementsByTagName('button')[0];

        const outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles',
          ],
        });

        expect(outcome.results[0].errors).to.eql([
          [
            'Button with inline icon image has no aria-label or aria-labelledby:',
            { xpath: '/html/body/button', element: el },
          ],
        ]);
      });
    });

    describe('Button with no text and with a background image with no aria-label or aria-labelledby', function () {
      var testNode =
        '<button style="background-image: url(\'next-icon.svg\')"></button>';

      it('should fail', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>');
        var el = document.getElementsByTagName('button')[0];

        const outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles',
          ],
        });

        expect(outcome.results[0].errors).to.eql([
          [
            'Button with inline icon image has no aria-label or aria-labelledby:',
            { xpath: '/html/body/button', element: el },
          ],
        ]);
      });
    });
  });
});

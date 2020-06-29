/* eslint-env mocha */
var a11y = require('../lib/a11y.js');
var expect = require('chai').expect;
var $ = require('jquery');

describe('Fields', function () {
  describe('Accessible fields', function () {
    it('should not return an error when a visible input element has a title', async function () {
      $('body').html('<html><body><input title="input"></body></html>');
      this.field = document.getElementsByTagName('input')[0];

      const outcome = await a11y.test({
        only: [
          'Forms: Labelling form controls: Fields must have labels or titles',
        ],
      });

      expect(outcome.results[0].errors).to.eql([]);
    });

    it('should not return an error when a visible input element is of type image and has a src and alt attribute', async function () {
      $('body').html(
        '<html><body><input type="image" src="next-icon.svg" alt="Next"></body></html>'
      );
      this.field = document.getElementsByTagName('input')[0];

      const outcome = await a11y.test({
        only: [
          'Forms: Labelling form controls: Fields must have labels or titles',
        ],
      });

      expect(outcome.results[0].errors).to.eql([]);
    });

    it('should not return an error when a visible input element has a <label> element referring to it', async function () {
      $('body').html(
        '<html><body><label for="input">Label</label><input id="input"></body></html>'
      );
      this.field = document.getElementsByTagName('input')[0];

      const outcome = await a11y.test({
        only: [
          'Forms: Labelling form controls: Fields must have labels or titles',
        ],
      });

      expect(outcome.results[0].errors).to.eql([]);
    });

    it('should not return an error when a button with no text and an inline image has an aria-label', async function () {
      $('body').html(
        '<html><body><button class="arrows__chevron" aria-label="Scroll carousel right"><img src="some-icon.png" /></button></body></html>'
      );
      this.button = document.getElementsByTagName('button')[0];

      const outcome = await a11y.test({
        only: [
          'Forms: Labelling form controls: Fields must have labels or titles',
        ],
      });

      expect(outcome.results[0].errors).to.eql([]);
    });

    it('should not return an error when a button with no text and inline image has an aria-labelledby', async function () {
      $('body').html(
        '<html><body><div id="my_label">My label</div><button aria-labelledby="my_label"><img src="some-icon.png" /></button></body></html>'
      );
      this.button = document.getElementsByTagName('button')[0];

      const outcome = await a11y.test({
        only: [
          'Forms: Labelling form controls: Fields must have labels or titles',
        ],
      });

      expect(outcome.results[0].errors).to.eql([]);
    });

    it('should not return an error when a button with no text and background image CSS has an aria-labelledby', async function () {
      $('body').html(
        '<html><body><div id="my_label">My label</div><button style="background-image: url(\'next-icon.svg\')" aria-label="Next"></button></body></html>'
      );
      this.button = document.getElementsByTagName('button')[0];

      const outcome = await a11y.test({
        only: [
          'Forms: Labelling form controls: Fields must have labels or titles',
        ],
      });

      expect(outcome.results[0].errors).to.eql([]);
    });

    it('should not return an error when a button with no text and background image CSS has an aria-labelledby', async function () {
      $('body').html(
        '<html><body><div id="my_label">My label</div><button style="background-image: url(\'next-icon.svg\')" aria-labelledby="Next"></button></body></html>'
      );
      this.button = document.getElementsByTagName('button')[0];

      const outcome = await a11y.test({
        only: [
          'Forms: Labelling form controls: Fields must have labels or titles',
        ],
      });

      expect(outcome.results[0].errors).to.eql([]);
    });
  });

  describe('Not accessible fields', function () {
    it('should return an error when a visible input element has no title', async function () {
      $('body').html('<html><body><input></body></html>');
      this.field = document.getElementsByTagName('input')[0];

      const outcome = await a11y.test({
        only: [
          'Forms: Labelling form controls: Fields must have labels or titles',
        ],
      });

      expect(outcome.results[0].errors).to.eql([
        [
          'Field has no label or title attribute:',
          { xpath: '/html/body/input', element: this.field },
        ],
      ]);
    });

    it('should return an error when a visible input element is of type image and has no src', async function () {
      $('body').html(
        '<html><body><input type="image" alt="Next" /></body></html>'
      );
      this.field = document.getElementsByTagName('input')[0];

      const outcome = await a11y.test({
        only: [
          'Forms: Labelling form controls: Fields must have labels or titles',
        ],
      });

      expect(outcome.results[0].errors).to.eql([
        [
          'Field with type of image has no src:',
          { xpath: '/html/body/input', element: this.field },
        ],
      ]);
    });

    it('should return an error when a visible input element is of type image and has no alt attribute', async function () {
      $('body').html(
        '<html><body><input type="image" src="next-icon.svg" /></body></html>'
      );
      this.field = document.getElementsByTagName('input')[0];

      const outcome = await a11y.test({
        only: [
          'Forms: Labelling form controls: Fields must have labels or titles',
        ],
      });

      expect(outcome.results[0].errors).to.eql([
        [
          'Field with type of image has no alt text:',
          { xpath: '/html/body/input', element: this.field },
        ],
      ]);
    });

    it('should return an error when a button has no text or no inline image', async function () {
      $('body').html(
        '<html><body><button class="arrows__chevron"></button></body></html>'
      );
      this.button = document.getElementsByTagName('button')[0];

      const outcome = await a11y.test({
        only: [
          'Forms: Labelling form controls: Fields must have labels or titles',
        ],
      });

      expect(outcome.results[0].errors).to.eql([
        [
          'Button has no text or image:',
          { xpath: '/html/body/button', element: this.button },
        ],
      ]);
    });

    it('should return an error when a button with no text and an inline image has no aria-label or aria-labelledby', async function () {
      $('body').html(
        '<html><body><button class="arrows__chevron"><img src="some-icon.png" /></button></body></html>'
      );
      this.button = document.getElementsByTagName('button')[0];

      const outcome = await a11y.test({
        only: [
          'Forms: Labelling form controls: Fields must have labels or titles',
        ],
      });

      expect(outcome.results[0].errors).to.eql([
        [
          'Button with inline icon image has no aria-label or aria-labelledby:',
          { xpath: '/html/body/button', element: this.button },
        ],
      ]);
    });

    it('should return an error when a button with no text and a background image has no aria-label or aria-labelledby', async function () {
      $('body').html(
        '<html><body><button style="background-image: url(\'next-icon.svg\')"></button></body></html>'
      );
      this.button = document.getElementsByTagName('button')[0];

      const outcome = await a11y.test({
        only: [
          'Forms: Labelling form controls: Fields must have labels or titles',
        ],
      });

      expect(outcome.results[0].errors).to.eql([
        [
          'Button with inline icon image has no aria-label or aria-labelledby:',
          { xpath: '/html/body/button', element: this.button },
        ],
      ]);
    });
  });
});

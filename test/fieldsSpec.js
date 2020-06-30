/* eslint-env mocha */
var a11y = require('../lib/a11y.js')
var expect = require('chai').expect
var $ = require('jquery')

describe('Fields', function () {
  describe('Accessible fields', function () {
    describe('Input with a title', function () {
      var testNode = '<input title="input">'

      it('should pass', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>')

        var outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles'
          ]
        })

        var errors = outcome.results[0].errors

        expect(errors).to.eql([])
      })
    })

    describe('Image input with src and alt text', function () {
      var testNode = '<input type="image" src="next-icon.svg" alt="Next">'

      it('should pass', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>')

        var outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles'
          ]
        })

        var errors = outcome.results[0].errors

        expect(errors).to.eql([])
      })
    })

    describe('Input with a <label> element referring to it', function () {
      var testNode = '<label for="input">Label</label><input id="input">'

      it('should pass', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>')

        var outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles'
          ]
        })

        var errors = outcome.results[0].errors

        expect(errors).to.eql([])
      })
    })

    describe('Button with no text with an inline image with an aria-label', function () {
      var testNode =
        '<button aria-label="Scroll carousel right"><img src="some-icon.png" alt="" /></button>'

      it('should pass', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>')

        var outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles'
          ]
        })

        var errors = outcome.results[0].errors

        expect(errors).to.eql([])
      })
    })

    describe('Button with no text with an inline image with an aria-labelledby', function () {
      var testNode =
        '<button aria-labelledby="my_label"><img src="some-icon.png" alt="" /></button>'

      it('should pass', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>')

        var outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles'
          ]
        })

        var errors = outcome.results[0].errors

        expect(errors).to.eql([])
      })
    })

    describe('Button with no text with a background image with an aria-label', function () {
      var testNode =
        '<button style="background-image: url(\'next-icon.svg\')" aria-label="Next"></button>'

      it('should pass', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>')

        var outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles'
          ]
        })

        var errors = outcome.results[0].errors

        expect(errors).to.eql([])
      })
    })

    describe('Button with no text with a background image with an aria-labelledby', function () {
      var testNode =
        '<button style="background-image: url(\'next-icon.svg\')" aria-labelledby="Next"></button>'

      it('should pass', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>')

        var outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles'
          ]
        })

        var errors = outcome.results[0].errors

        expect(errors).to.eql([])
      })
    })

    describe('Button with no text with an inline image with alt text', function () {
      var testNode =
        '<button><img src="some-icon.png" alt="Some icon" /></button>'

      it('should pass', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>')

        var outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles'
          ]
        })

        var errors = outcome.results[0].errors

        expect(errors).to.eql([])
      })
    })
  })

  describe('Not accessible fields', function () {
    describe('Input with no title', function () {
      var testNode = '<input>'

      it('should fail', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>')
        var el = document.getElementsByTagName('input')[0]

        var outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles'
          ]
        })

        var errors = outcome.results[0].errors[0]
        var errorMessage = errors[0]
        var pathToNode = errors[1]

        expect(errorMessage).to.eql('Field has no label or title attribute:')
        expect(pathToNode).to.eql({ xpath: '/html/body/input', element: el })
      })
    })

    describe('Image input with alt text with no src attribute and no <label>', function () {
      var testNode = '<input type="image" alt="Next" />'

      it('should fail', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>')
        var el = document.getElementsByTagName('input')[0]

        var outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles'
          ]
        })

        var errors = outcome.results[0].errors[0]
        var errorMessage = errors[0]
        var pathToNode = errors[1]

        expect(errorMessage).to.eql('Field with type of image has no src:')
        expect(pathToNode).to.eql({ xpath: '/html/body/input', element: el })
      })
    })

    describe('Image input with no alt text', function () {
      var testNode = '<input type="image" src="next-icon.svg" />'

      it('should fail', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>')
        var el = document.getElementsByTagName('input')[0]

        var outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles'
          ]
        })

        var errors = outcome.results[0].errors[0]
        var errorMessage = errors[0]
        var pathToNode = errors[1]

        expect(errorMessage).to.eql(
          'Field with type of image has no alt text:'
        )
        expect(pathToNode).to.eql({ xpath: '/html/body/input', element: el })
      })
    })

    describe('Image input with empty alt text', function () {
      var testNode = '<input type="image" src="next-icon.svg" alt="" />'

      it('should fail', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>')
        var el = document.getElementsByTagName('input')[0]

        var outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles'
          ]
        })

        var errors = outcome.results[0].errors[0]
        var errorMessage = errors[0]
        var pathToNode = errors[1]

        expect(errorMessage).to.eql(
          'Field with type of image has no alt text:'
        )
        expect(pathToNode).to.eql({ xpath: '/html/body/input', element: el })
      })
    })

    describe('Button with no text and no inline or background image', function () {
      var testNode = '<button></button>'

      it('should fail', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>')
        var el = document.getElementsByTagName('button')[0]

        var outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles'
          ]
        })

        var errors = outcome.results[0].errors[0]
        var errorMessage = errors[0]
        var pathToNode = errors[1]

        expect(errorMessage).to.eql('Button has no text or image:')
        expect(pathToNode).to.eql({ xpath: '/html/body/button', element: el })
      })
    })

    describe('Button with no text with no aria-label or aria-labelledby containing an inline image with no alt text', function () {
      var testNode = '<button><img src="some-icon.png" /></button>'

      it('should fail', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>')
        var el = document.getElementsByTagName('button')[0]

        var outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles'
          ]
        })

        var errors = outcome.results[0].errors[0]
        var errorMessage = errors[0]
        var pathToNode = errors[1]

        expect(errorMessage).to.eql(
          'Button with no text with an inline image has no alt text:'
        )
        expect(pathToNode).to.eql({ xpath: '/html/body/button', element: el })
      })
    })

    describe('Button with no text and with a background image with no aria-label or aria-labelledby', function () {
      var testNode =
        '<button style="background-image: url(\'next-icon.svg\')"></button>'

      it('should fail', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>')
        var el = document.getElementsByTagName('button')[0]

        var outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles'
          ]
        })

        var errors = outcome.results[0].errors[0]
        var errorMessage = errors[0]
        var pathToNode = errors[1]

        expect(errorMessage).to.eql(
          'Button with inline image or background image has no aria-label or aria-labelledby:'
        )
        expect(pathToNode).to.eql({ xpath: '/html/body/button', element: el })
      })
    })

    describe('Input with no <label> element referring to it', function () {
      var testNode = '<label>Label</label><input id="input">'

      it('should fail', async function () {
        $('body').html('<html><body>' + testNode + '</body></html>')
        var el = document.getElementsByTagName('input')[0]

        var outcome = await a11y.test({
          only: [
            'Forms: Labelling form controls: Fields must have labels or titles'
          ]
        })

        var errors = outcome.results[0].errors[0]
        var errorMessage = errors[0]
        var pathToNode = errors[1]

        expect(errorMessage).to.eql('Field has no label or title attribute:')
        expect(pathToNode).to.eql({
          xpath: "//input[@id='input']",
          element: el
        })
      })
    })
  })
})

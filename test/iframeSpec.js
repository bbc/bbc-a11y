/* eslint-env mocha */
const a11y = require('../lib/a11y.js')
const expect = require('chai').expect
const $ = require('jquery')

describe('a11y testing in frames', function () {
  beforeEach(function () {
    $('body').html('<html><body><div role="main"><h1>Top level</h1><iframe src="about:blank"></iframe></div></body></html>')
    this.iframe1 = document.querySelector('iframe')
    const doc = this.iframe1.contentWindow.document
    doc.open()
    doc.write('<html><body><p>Second level <a>second level anchor</a></p><iframe src="about:blank"></iframe><iframe src="about:blank"></iframe></body></html>')
    doc.close()
    this.iframe2 = doc.body.querySelectorAll('iframe')[0]
    const doc2 = this.iframe2.contentWindow.document
    doc2.open()
    doc2.write('<html><body><h3>Third level<h3></body></html>')
    doc2.close()
    this.iframe3 = doc.body.querySelectorAll('iframe')[1]
    const doc3 = this.iframe3.contentWindow.document
    doc3.open()
    doc3.write('<html><body><h3>Third level again<h3></body></html>')
    doc3.close()

    this.heading1 = doc2.getElementsByTagName('h3')[0]
    this.heading2 = doc3.getElementsByTagName('h3')[0]
    this.anchor = doc.getElementsByTagName('a')[0]
  })

  it('tests contents of iframes', async function () {
    const outcome = await a11y.test({ only: ['Principles: Anchors must have hrefs', 'Structure: Headings: Headings must be in ascending order', 'Structure: Headings: Exactly one main heading', 'Structure: Containers and landmarks: Exactly one main landmark'] })

    expect(outcome.results[0].errors).to.eql([
      ['In frame', { element: this.iframe1, xpath: '/html/body/div/iframe' }, ':', 'Anchor has no href attribute:', { element: this.anchor, xpath: '/html/body/p/a' }]
    ])
    expect(outcome.results[1].warnings).to.eql([
      ['In frame', { element: this.iframe1, xpath: '/html/body/div/iframe' }, { element: this.iframe2, xpath: '/html/body/iframe[1]' }, ':', 'First heading was not a main heading:', { element: this.heading1, xpath: '/html/body/h3[1]' }],
      ['In frame', { element: this.iframe1, xpath: '/html/body/div/iframe' }, { element: this.iframe3, xpath: '/html/body/iframe[2]' }, ':', 'First heading was not a main heading:', { element: this.heading2, xpath: '/html/body/h3[1]' }]
    ])
    expect(outcome.results[2].errors).to.eql([])
    expect(outcome.results[3].errors).to.eql([])
  })
})

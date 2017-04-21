/* eslint-env mocha */
var detectTableType = require('../lib/detectTableType')
var expect = require('chai').expect

describe('detectTableType', function () {
  var container, table

  beforeEach(function () {
    container = document.createElement('div')
    table = document.createElement('table')
    document.body.appendChild(container)
    container.appendChild(table)
  })

  describe('a table inside editable area', function () {
    it('is a data table', function () {
      container.contentEditable = 'true'
      expect(detectTableType(table)).to.equal('data')
    })
  })

  describe('a table with role="grid"', function () {
    it('is a data table', function () {
      table.setAttribute('role', 'grid')
      expect(detectTableType(table)).to.equal('data')
    })
  })

  describe('a table with role="treegrid"', function () {
    it('is a data table', function () {
      table.setAttribute('role', 'treegrid')
      expect(detectTableType(table)).to.equal('data')
    })
  })

  describe('a table with role="landmark"', function () {
    it('is a data table', function () {
      table.setAttribute('role', 'landmark')
      expect(detectTableType(table)).to.equal('data')
    })
  })

  describe('a table with datatable="0"', function () {
    it('is a data table', function () {
      table.setAttribute('datatable', '0')
      expect(detectTableType(table)).to.equal('layout')
    })
  })

  describe('a table created by CSS display style', function () {
    it('is a data table', function () {
      container.style.display = 'table'
      expect(detectTableType(container)).to.equal('layout')
    })
  })

  describe('a table with a summary attribute', function () {
    it('is a data table', function () {
      table.setAttribute('summary', 'tabular')
      expect(detectTableType(table)).to.equal('data')
    })
  })

  describe('a table with a <caption>', function () {
    it('is a data table', function () {
      table.appendChild(document.createElement('caption'))
      expect(detectTableType(table)).to.equal('data')
    })
  })

  describe('a table with a <col>', function () {
    it('is a data table', function () {
      table.appendChild(document.createElement('col'))
      expect(detectTableType(table)).to.equal('data')
    })
  })

  describe('a table with a <colgroup>', function () {
    it('is a data table', function () {
      table.appendChild(document.createElement('colgroup'))
      expect(detectTableType(table)).to.equal('data')
    })
  })

  describe('a table with a <tfoot>', function () {
    it('is a data table', function () {
      table.appendChild(document.createElement('tfoot'))
      expect(detectTableType(table)).to.equal('data')
    })
  })

  describe('a table with a <thead>', function () {
    it('is a data table', function () {
      table.appendChild(document.createElement('thead'))
      expect(detectTableType(table)).to.equal('data')
    })
  })

  describe('a table with a <th>', function () {
    it('is a data table', function () {
      table.appendChild(document.createElement('th'))
      expect(detectTableType(table)).to.equal('data')
    })
  })

  describe('a table with a <tr><td header="x">ok</td></tr>', function () {
    it('is a data table', function () {
      table.innerHTML = '<tr><td header="x">ok</td></tr>'
      expect(detectTableType(table)).to.equal('data')
    })
  })

  describe('a table with a <tr><td scope="x">ok</td></tr>', function () {
    it('is a data table', function () {
      table.innerHTML = '<tr><td scope="x">ok</td></tr>'
      expect(detectTableType(table)).to.equal('data')
    })
  })

  describe('a table with a <tr><td abbr="x">ok</td></tr>', function () {
    it('is a data table', function () {
      table.innerHTML = '<tr><td abbr="x">ok</td></tr>'
      expect(detectTableType(table)).to.equal('data')
    })
  })

  describe('a table with <tr><td><abbr>ok</abbr></td></tr>', function () {
    it('is a data table', function () {
      table.innerHTML = '<tr><td><abbr>ok</abbr></td></tr>'
      expect(detectTableType(table)).to.equal('data')
    })
  })

  describe('a table with a <tr><td><abbr>foo</abbr><p>bar</p></td></tr>', function () {
    it('is a layout table', function () {
      table.innerHTML = '<tr><td><abbr>foo</abbr><p>bar</p></td></tr>'
      expect(detectTableType(table)).to.equal('layout')
    })
  })

  describe('a table with a nested table', function () {
    it('is a layout table', function () {
      table.innerHTML = rowsWithTwoColumns(11) + '<tr><td><table /></td></tr>'
      expect(detectTableType(table)).to.equal('layout')
    })
  })

  describe('a table with 3 rows and 5 columns', function () {
    it('is a data table', function () {
      var rows = '<tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td></tr>' +
                 '<tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td></tr>' +
                 '<tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td></tr>'
      table.innerHTML = rows
      expect(detectTableType(table)).to.equal('data')
      table.innerHTML = '<tbody>' + rows + '</tbody>'
      expect(detectTableType(table)).to.equal('data')
    })
  })

  describe('a table with 1 column and 20 rows', function () {
    it('is a data table', function () {
      var rows = ''
      for (var i = 0; i < 20; i++) { rows += '<tr><td>row</td></tr>' }
      table.innerHTML = rows
      expect(detectTableType(table)).to.equal('data')
      table.innerHTML = '<tbody>' + rows + '</tbody>'
      expect(detectTableType(table)).to.equal('data')
    })
  })

  describe('a table with borders around cells', function () {
    it('is a data table', function () {
      table.innerHTML = '<tr><td style="border: 1px solid green">row</td></tr>'
      expect(detectTableType(table)).to.equal('data')
    })
  })

  describe('a wide table (> 95% document width)', function () {
    it('is a layout table', function () {
      var iframe = document.createElement('iframe')
      document.body.appendChild(iframe)
      iframe.contentDocument.write('<table>' + rowsWithTwoColumns(10) + '</table>')
      iframe.contentDocument.body.style = 'padding: 0; margin: 0'
      table = iframe.contentDocument.getElementsByTagName('table')[0]
      expect(detectTableType(table)).to.equal('data')
      table.style.width = '96%'
      expect(detectTableType(table)).to.equal('layout')
    })
  })

  describe('a table with 10 cells', function () {
    it('is a layout table', function () {
      table.innerHTML = rowsWithTwoColumns(6)
      expect(detectTableType(table)).to.equal('data')
      table.innerHTML = rowsWithTwoColumns(5)
      expect(detectTableType(table)).to.equal('layout')
    })
  })

  describe('a table with <tr><td><object /></td></tr>', function () {
    it('is a layout table', function () {
      table.innerHTML = rowsWithTwoColumns(6)
      expect(detectTableType(table)).to.equal('data')
      table.innerHTML = rowsWithTwoColumns(6) + '<tr><td><object /></td></tr>'
      expect(detectTableType(table)).to.equal('layout')
    })
  })

  describe('a table with <tr><td><embed /></td></tr>', function () {
    it('is a layout table', function () {
      table.innerHTML = rowsWithTwoColumns(6)
      expect(detectTableType(table)).to.equal('data')
      table.innerHTML = rowsWithTwoColumns(6) + '<tr><td><embed /></td></tr>'
      expect(detectTableType(table)).to.equal('layout')
    })
  })

  describe('a table with <tr><td><applet /></td></tr>', function () {
    it('is a layout table', function () {
      table.innerHTML = rowsWithTwoColumns(6)
      expect(detectTableType(table)).to.equal('data')
      table.innerHTML = rowsWithTwoColumns(6) + '<tr><td><applet /></td></tr>'
      expect(detectTableType(table)).to.equal('layout')
    })
  })

  function rowsWithTwoColumns (n) {
    var rows = ''
    for (var i = 0; i < n; i++) { rows += '<tr><td>1</td><td>2</td></tr>' }
    return rows
  }
})

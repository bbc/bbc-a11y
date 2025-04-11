const $ = require('jquery')

function detectTableType (table) {
  const $table = $(table)
  if ($table.is(':not(table),[datatable=0]')) {
    return 'layout'
  }

  if ($table.parents('[contenteditable=true]').length > 0 ||
      $table.is('[role=grid],[role=treegrid],[role=landmark],[summary],:has(caption,col,colgroup,tfoot,thead,th,td[header],td[scope],td[abbr],td:has(>abbr:only-child))')) {
    return 'data'
  }

  if ($table.is(':has(table)')) {
    return 'layout'
  }

  const cells = $table.find('> tr > td, > tbody > tr > td')
  const rows = $table.find('> tr, > tbody > tr')
  const cols = Math.max.apply(null, rows.get().map(function (row) { return $(row).find('> td').length }))

  if (cols >= 5 || rows.length >= 20 || cells.get().some(function (cell) { return $(cell).css('border-width') !== '0px' })) {
    return 'data'
  }

  if (rows.length === 1 || cols === 1) {
    return 'layout'
  }

  const tableWidth = $(table).width()
  const documentWidth = $(table.ownerDocument).width()
  const percentOfDocumentWidth = (tableWidth / documentWidth) * 100
  if (percentOfDocumentWidth > 95) {
    return 'layout'
  }

  if (cells.length <= 10) {
    return 'layout'
  }

  if ($table.is(':has(object,embed,applet)')) {
    return 'layout'
  }

  return 'data'
}

module.exports = detectTableType

function replaceElementsWithXPaths (things) {
  var thangs = []
  for (var i = 0; i < things.length; ++i) {
    thangs = thangs.concat(replaceElementWithXPaths(things[i]))
  }
  return thangs
}

function xpathForElement (node) {
  if (!node.tagName) return ''
  if (node.id) return '//' + node.tagName.toLowerCase() + "[@id='" + node.id + "']"
  var xpath = '/' + node.tagName.toLowerCase()
  if (node.parentNode) {
    xpath = xpathForElement(node.parentNode) + xpath
    var sameTags = childrenWithTagName(node.parentNode, node.tagName)
    if (sameTags.length > 1) {
      xpath += '[' + (sameTags.indexOf(node) + 1) + ']'
    }
  }
  return xpath
}

function childrenWithTagName (element, tagName) {
  if (!element.children) return []
  var children = []
  for (var i = 0; i < element.children.length; ++i) {
    if (element.children[i].tagName === tagName) {
      children.push(element.children[i])
    }
  }
  return children
}

function replaceElementWithXPaths (el) {
  if (el instanceof Array) {
    return [].concat.apply([], el.map(replaceElementWithXPaths))
  } else if (typeof (el.tagName) === 'string') {
    return { xpath: xpathForElement(el), element: el }
  } else if (typeof (el.get) === 'function') {
    return replaceElementWithXPaths(el.get())
  } else {
    return el
  }
}

module.exports.replaceElementsWithXPaths = replaceElementsWithXPaths

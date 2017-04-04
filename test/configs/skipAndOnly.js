/* global page */
page('http://www.bbc.co.uk', {
  skip: 'x'
})
page('http://www.bbc.co.uk/news', {
  skip: ['y', 'z']
})
page('http://www.bbc.co.uk/sport', {
  only: 'a'
})
page('http://www.bbc.co.uk/weather', {
  only: ['b', 'c']
})

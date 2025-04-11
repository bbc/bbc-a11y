/* global page */
page('https://www.bbc.co.uk', {
  skip: 'x'
})
page('https://www.bbc.co.uk/news', {
  skip: ['y', 'z']
})
page('https://www.bbc.co.uk/sport', {
  only: 'a'
})
page('https://www.bbc.co.uk/weather', {
  only: ['b', 'c']
})

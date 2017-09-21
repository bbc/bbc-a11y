/* global page */
page('http://www.bbc.co.uk', {
  skip: [
    'Headings: Content must follow headings',
    'Minimum Text Size: Text cannot be too small'
  ]
})
page('http://www.bbc.co.uk/news', {
  skip: 'Headings: Content must follow headings'
})

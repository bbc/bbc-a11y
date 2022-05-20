/* global page */
page('https://www.bbc.co.uk', {
  skip: [
    'Headings: Content must follow headings',
    'Minimum Text Size: Text cannot be too small'
  ]
})
page('https://www.bbc.co.uk/news', {
  skip: 'Headings: Content must follow headings'
})

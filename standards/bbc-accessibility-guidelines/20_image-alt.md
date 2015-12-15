# Image alternative content

All images **must** have an alt attribute.

All editorial significant images **must** have a non-null alt attribute value, or a text alternative in the preceding or following content.

## Rationale

Assistive technologies such as screen readers will provide a text alternative for images that do not have alt attributes based on the image file name. For images that do not have editorial significance or are described in the surrounding text content it is appropriate to use a null (alt="") value for the image alt attribute to avoid this.

All editorially significantly images must have a text alternative either as the value of the alt attribute or in the immediately surrounding text content.

## Techniques

Pass:

    <img src="bbc-logo.png" alt="BBC">

    <h1>Story headline</h1>
    <img src="story-image.png" alt="">

Fail:

    <img src="bbc-logo.png">

    <h1>Story headline</h1>
    <img src="story-image.png" alt="Story headline">

## Tests

| Procedure | Expected Result | Type | 
| --------- | --------------- | ---- |
| Identify each image on the page | Every image must have an alt attribute | Manual |
| Identify each editorially significant image on the page | Every editorially significant image must have a text alternative either as the value of the alt attribute or in the immediately surrounding text content. | Manual |
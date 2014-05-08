# HTML

## Content must be resizable to 200% (incomplete)

Text **must** be styled with units that are resizable in all browsers.

Content **must** be visible and usable with text resized to 200% of normal.

Content **must** be visible and usable with page zoomed to 200% of normal.

### Definitions

#### Visible

Content is not clipped and does not overlap other content, and has sufficient spacing to make it readable.

#### Usable

Links, forms, and other controls are not overlapped with other elements making them un-clickable.

### Rationale

Standard browser features for resizing text or page zoom can make content accessible to many low vision users without the need for additional assistive technologies such as screen magnifiers or screen readers.

Text resizing and page zoom cater to different needs, and therefore both should be supported.

Internet Explorer does not resize text that have been styled in `px` units, therefore `em`, `%` or similar units should be used.

### Techniques

Pass:

	<style>
		body {
			font-size: 90%;
		}
	</style>

Fail:

	<style>
		body {
			font-size: 12px;
		}
	</style>

### Test

| Procedure | Expected Result | Type | 
| --------- | --------------- | ---- |
| In a browser that supports page zoom, increase the zoom level to 200% | All content must be visible and usable | Manual |
| In a browser that supports text resize, increase text resize to 200% | All content must be visible and usable | Manual |
| In Internet Explorer, increase text resize | All text content should increase in size | Manual |
	
# Notes

The first two tests will have to be manual I think, but is it possible to make automate the 'px' test?
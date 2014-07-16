# Content must be resizable to 200

Text **must** be styled with units that are resizable in all browsers.

Content **must** be visible and usable with text resized to 200% of normal.

Content **must** be visible and usable with page zoomed to 200% of normal.

Where available on a platform zoom **must** be suported.

## Rationale

Standard browser features for resizing text or page zoom can make content accessible to many low vision users without the need for additional assistive technologies such as screen magnifiers or screen readers.

Text resizing and page zoom cater to different needs, and therefore both should be supported.

Internet Explorer does not resize text that have been styled in `px` units, therefore `em`, `%` or similar units should be used.

Browsers on iOS, Android, and other mobile platforms also support zoom with pinch-in and pinch-out gestures. In most cases it is just a matter of not disabling this, but there are some cases when it is appropriate to implement content specific interactions, such as with zoomable maps, which should mimic the same pinch-in and pinch-out gestures.

## Definitions

### Visible

Content is not clipped and does not overlap other content, and has sufficient spacing to make it readable.

### Usable

Links, forms, and other controls are not overlapped with other elements making them un-clickable.

## Techniques

Pass:

	<style>
	body {
		font-size: 1.3em;
	}
	</style>

	<meta name="viewport" content="user-scalable=YES">
	
	<meta name="viewport" content="width=device-width;
		initial-scale=1.0; maximum-scale=2.0;
		user-scalable=1;">

Fail:
	
	<style>
	body {
		font-size: 13px;
	}
	</style>

	<style>
	body {
		overflow: hidden;
	}
	</style>

	<meta name="viewport" content="user-scalable=no" />
	
	<meta name="viewport" content="width=device-width;
		initial-scale=1.0; maximum-scale=1.0;
		user-scalable=1;">

## Test

| Procedure | Expected Result | Type | 
| --------- | --------------- | ---- |
| In a browser that supports page zoom, increase the zoom level to 200% | All content must be visible and usable | Manual |
| In a browser that supports text resize, increase text resize to 200% | All content must be visible and usable | Manual |
| In Internet Explorer, increase text resize | All text content should increase in size | Manual |
| On platforms that support it, use pinch-in and pinch-out to zoom content | All content should increase and descrease in size | Manual |

--
	
## Notes

The first two tests will have to be manual I think, but is it possible to make automate the 'px' test?
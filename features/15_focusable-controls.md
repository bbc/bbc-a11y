# Correctly use links and buttons

Controls for JavaScript enhanced interactions **must** be `<a>`, `<button>`, or `<input>[type=checkbox,color,date,datetime,datetime-local,email,file,month,number,password,radio,range,search,tel,text,time,url,week]` elements if that is the only mechanism for controlling them.

`<a>` elements used for controls **must** have an `href` attribute.

Controls that have no purpose without JavaScript **must not** be added to the page before the associated code is available capable of running.

## Rationale

When creating controls for user interaction with JavaScript enhanced features, for example a carousel with previous and next controls, the controls must be implemented with elements that provide natively focusable elements with click, keydown, and focus events so they are accessible to keyboard as well as pointing device users. If there is an alternative method of controlling the feature, for example a carousel that automatically displays new content when it receives content then controls that are only available to pointing device users can be used.

In general, use `<a>` elements when there is a URL associated with the interaction when JavaScript is not enabled, and `<button>` elements for interactions that don't have an associated URL.

`<a>` elements without a `href` attribute are not keyboard accessible, and therefore must not be used for controls.

When there is no core (non-JavaScript) interaction then the control must not be added to the document before the associated JavaScript is capable of running as this would lead to controls that apparently do nothing, potentially causing confusion to users.

## Techniques

Pass:

    <button type="button">Open panel</button>

    <ul>
        <li><a href="#newstab">News</a></li>
        <li><a href="#sporttab">Sport</a></li>
        <li><a href="#entertainmenttab">Entertainment</a></li>
    </ul>

Fail:

    <a href="#">Open panel</a>

    <ul>
        <li><a>News</a></li>
        <li><a>Sport</a></li>
        <li><a>Entertainment</a></li>
    </ul>

## Tests

| Procedure | Expected Result | Type | 
| --------- | --------------- | ---- |
| Identify each control on the page | Navigate the page with a keyboard and ensure that each control is accessible | Manual |
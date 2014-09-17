# Forms must have a submit button and forms must not update the location of the page on change, focus, or blur events

All `<form>` elements that take user input (i.e. do not consist only of `input[type=hidden]` elements to store state) **must** have a submit button in the form of a `<input>[type=submit,image]` or `<button>[type=submit]` element.

Changes to the page **must** location must only take place on explicit user action i.e. when a submit button is activated. They must not take place when change (particularly for `select` elements), focus, or blur events are fired.

## Rationale

All forms should have a submit button to provide a clear call to action. This is particularly important to users with cognitive disabilities, but is also beneficial to low vision users as an indication of the end of the form.

## Techniques

Pass:

    <form action="/search">
        <label for="q">Search term:</label>
        <input type="text" name="q" id="q">
        <input type="submit" value="Search">
    </form>

Fail:

    <form action="/search">
        <label for="q">Search term:</label>
        <input type="text" name="q" id="q">
    </form>

## Tests

| Procedure | Expected Result | Type | 
| --------- | --------------- | ---- |
| Identify every `<form>` or collection of form elements | Each `<form>` or collection of form elements must have a submit button | Manual |
| Test each `<form>` or collection of form elements | Page location must not change on change, focus, or blur events | Manual |
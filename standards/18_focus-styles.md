# Focusable elements must have a clear visual indication when they receive focus

All focusable elements **must** have a clearly identifiable visual style when they have focus

## Rationale

Sighted keyboard users do not have the explicit association between pointer and content that pointing device users have, so it is important that they are aware at all times what element currently has focus and which element keyboard interactions will operate on.

The currently focussed element should therefore have a visual style that makes it clearly distinguishable from the surrounding content.

## Techniques

Pass:

	<style>
	    a {
        	text-decoration: none;
        }
        a:focus {
        	text-decoration: underline;
        }
	</style>

Fail:

	<style>
	    a {
        	outline: none;
        }
	</style>

## Test

| Procedure | Expected Result | Type | 
| --------- | --------------- | ---- |
| For every `<a>`, `<button>`, or other focusable element check the visual style of the `:focus` state | All `<a>`, `<button>`, and other focusable elements must have a visually distinguishable style between their regular and `:focus` states | Manual |
# HTML

## Correctly markup data tables

Data tables **must** be marked up in a way that enable browsers and assistive technologies to identify them as such.

### Rationale

Assistive technologies such as screen readers identify HTML tables as being either for data or for layout based on the markup used.

If a `<table>` is identified as a layout table then potentially useful structures may be ignored.

### Definitions

#### Algorithm

The following algorithm is used to determine if a `<table>` has been  marked up in a way that allows browsers and assistive technologies to identify it as a data table:

1. Table inside editable area is data table always since the table structure is crucial for table editing
2. Table having ARIA table related `role` is data table (like ARIA `grid` or `treegrid`)
3. Table having ARIA landmark `role` is data table
4. Table having `datatable="0"` attribute is layout table
5. Table created by CSS `display` style is layout table
6. Table having summary attribute or legitimate data table structures is data table; these structures are:
	- `<caption>` element
	- `<col>` or `<colgroup>` elements
	- `<tfoot>` or `<thead>` elements
	- `<th>` elements 
	- `header`, `scrope` or `abbr` attributes on table cell
	- `abbr` element as a single child element of table cell
7. Table having nested table is layout table
8. Table having only one row or column is layout table
9. Table having many columns (>= 5) is data table
10. Table having borders around cells is data table
11. Table having differently colored rows is data table
12. Table having many rows (>= 20) is data table
13. Wide table (more than 95% of the document width) is layout table
14. Table having small amount of cells (<= 10) is layout table
15. Table containing `<embed>`, `<object>`, `<applet>` of iframe elements (typical advertisements elements) is layout table
16. Otherwise it's data table

Go through each check in turn, stopping when you reach a data table or layout table result.

### Techniques

Pass:

	<table>
		<caption>Champions League Group C summary table</caption>
		<thead>
			<tr>
				<th scope="col">Team</th>
				<th scope="col">Score</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Malaga</td>
				<td>12</td>
			</tr>
			<tr>
				<td>AC Milan</td>
				<td>8</td>
			</tr>
			<tr>
				<td>Zenit Saint Petersburg</td>
				<td>7</td>
			</tr>
			<tr>
				<td>Anderlecht</td>
				<td>5</td>
			</tr>
		</tbody>
	</table>
		
Fail:

	<table>
		<tr>
			<td>Team</td>
			<td>Score</td>
		</tr>
		<tr>
			<td>Malaga</td>
			<td>12</td>
		</tr>
		<tr>
			<td>AC Milan</td>
			<td>8</td>
		</tr>
		<tr>
			<td>Zenit Saint Petersburg</td>
			<td>7</td>
		</tr>
		<tr>
			<td>Anderlecht</td>
			<td>5</td>
		</tr>
	</table>

### Test

| Procedure | Expected Result | Type | 
| --------- | --------------- | ---- |
| For each `<table>` element in the markup follow the defined algorithm | All data tables must be identifiable as a data table | Manual |

# Notes

Hopefully this is clear enough.
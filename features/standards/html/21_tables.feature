Feature: Tables

  Data tables must be marked up in a way that enable browsers and assistive
  technologies to identify them as such.

  Rationale
  =========

  Assistive technologies such as screen readers identify HTML tables as being
  either for data or for layout based on the markup used.

  If a <table> is identified as a layout table then potentially useful
  structures may be ignored.

  Definitions
  ===========

  Algorithm
  ---------

  The following algorithm is used to determine if a <table> has been marked up
  in a way that allows browsers and assistive technologies to identify it as a
  data table:

  * Table inside editable area is data table always since the table structure
    is crucial for table editing

  * Table having ARIA table related role is data table (like ARIA grid or
    treegrid)

  * Table having ARIA landmark role is data table

  * Table having datatable="0" attribute is layout table

  * Table created by CSS display style is layout table

  * Table having summary attribute or legitimate data table structures is data
    table; these structures are:

    * <caption> element
    * <col> or <colgroup> elements
    * <tfoot> or <thead> elements
    * <th> elements
    * header, scope or abbr attributes on table cell
    * abbr element as a single child element of table cell

  * Table having nested table is layout table

  * Table having only one row or column is layout table

  * Table having many columns (>= 5) is data table

  * Table having borders around cells is data table

  * Table having differently colored rows is data table

  * Table having many rows (>= 20) is data table

  * Wide table (more than 95% of the document width) is layout table

  * Table having small amount of cells (<= 10) is layout table

  * Table containing <embed>, <object>, <applet> of iframe elements (typical
    advertisements elements) is layout table

  * Otherwise it’s data table

  Go through each check in turn, stopping when you reach a data table or layout
  table result.

  Scenario: Data table
    Given a page with the body:
      """
      <table>
        <tr>
          <td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td>
        </tr>
        <tr>
          <td>7</td><td>8</td><td>9</td><td>10</td><td>11</td><td>12</td>
        </tr>
      </table>
      """
    When I test the "Tables: Use tables for data" standard
    Then it passes

  Scenario: Table with datatable="0"
    Given a page with the body:
      """
      <table datatable="0">
        <tr>
          <td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td>
        </tr>
        <tr>
          <td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td>
        </tr>
      </table>
      """
    When I test the "Tables: Use tables for data" standard
    Then it fails with the message:
      """
      Table used for layout: /html/body/table
      """

  Scenario: Table created by CSS display style
    Given a page with the body:
      """
      <div style="display:table">
        This isn't a table, it's just made to look like one
      </div>
      """
    When I test the "Tables: Use tables for data" standard
    Then it fails with the message:
      """
      Table used for layout: /html/body/div
      """

  Scenario: Nested table
    Given a page with the body:
      """
      <table>
        <tr>
          <td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td>
        </tr>
        <tr>
          <td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td>
        </tr>
        <tr>
          <td>
            <table>
              <tr>
                <td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td>
              </tr>
              <tr>
                <td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      """
    When I test the "Tables: Use tables for data" standard
    Then it fails with the message:
      """
      Table used for layout: /html/body/table
      """

  Scenario: Table with only one row and less than 5 columns
    Given a page with the body:
      """
      <table>
        <tr>
          <td>1</td><td>2</td><td>3</td><td>4</td>
        </tr>
      </table>
      """
    When I test the "Tables: Use tables for data" standard
    Then it fails with the message:
      """
      Table used for layout: /html/body/table
      """

  Scenario: Table with only one column
    Given a page with the body:
      """
      <table>
        <tr><td>1</td></tr>
        <tr><td>2</td></tr>
        <tr><td>3</td></tr>
        <tr><td>4</td></tr>
        <tr><td>5</td></tr>
        <tr><td>6</td></tr>
        <tr><td>7</td></tr>
        <tr><td>8</td></tr>
        <tr><td>9</td></tr>
        <tr><td>10</td></tr>
        <tr><td>11</td></tr>
        <tr><td>12</td></tr>
        <tr><td>13</td></tr>
        <tr><td>14</td></tr>
        <tr><td>15</td></tr>
        <tr><td>16</td></tr>
        <tr><td>17</td></tr>
        <tr><td>18</td></tr>
        <tr><td>19</td></tr>
      </table>
      """
    When I test the "Tables: Use tables for data" standard
    Then it fails with the message:
      """
      Table used for layout: /html/body/table
      """

  Scenario: Wide table
    Given a page with the body:
      """
      <!-- 110% to account for body padding -->
      <table style="width:110%">
        <tr>
          <td>1</td><td>2</td><td>3</td><td>4</td>
        </tr>
        <tr>
          <td>1</td><td>2</td><td>3</td><td>4</td>
        </tr>
        <tr>
          <td>1</td><td>2</td><td>3</td><td>4</td>
        </tr>
      </table>
      """
    When I test the "Tables: Use tables for data" standard
    Then it fails with the message:
      """
      Table used for layout: /html/body/table
      """

  Scenario: Table with few cells
    Given a page with the body:
      """
      <table>
        <tr>
          <td>1</td><td>2</td><td>3</td>
        </tr>
        <tr>
          <td>4</td><td>5</td><td>6</td>
        </tr>
        <tr>
          <td>7</td><td>8</td><td>9</td>
        </tr>
      </table>
      """
    When I test the "Tables: Use tables for data" standard
    Then it fails with the message:
      """
      Table used for layout: /html/body/table
      """

  Scenario: Tables with advertising elements
    Given a page with the body:
      """
      <table>
        <tr>
          <td>1</td><td>2</td><td>3</td><td>4</td>
        </tr>
        <tr>
          <td>5</td><td>6</td><td>7</td><td>8</td>
        </tr>
        <tr>
          <td>9</td><td>10</td><td>11</td><td><object /></td>
        </tr>
      </table>
      <table>
        <tr>
          <td>1</td><td>2</td><td>3</td><td>4</td>
        </tr>
        <tr>
          <td>5</td><td>6</td><td>7</td><td>8</td>
        </tr>
        <tr>
          <td>9</td><td>10</td><td>11</td><td><embed /></td>
        </tr>
      </table>
      <table>
        <tr>
          <td>1</td><td>2</td><td>3</td><td>4</td>
        </tr>
        <tr>
          <td>5</td><td>6</td><td>7</td><td>8</td>
        </tr>
        <tr>
          <td>9</td><td>10</td><td>11</td><td><applet /></td>
        </tr>
      </table>
      """
    When I test the "Tables: Use tables for data" standard
    Then it fails with the message:
      """
      Table used for layout: /html/body/table[1]
      Table used for layout: /html/body/table[2]
      Table used for layout: /html/body/table[3]
      """

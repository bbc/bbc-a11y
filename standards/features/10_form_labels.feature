Feature: Correctly use form labels


Scenario: Validate use of labels
    When I visit the page
    Then the following form elements must have a title attribute or associated label tag:
      | select                     |
      | textarea                   |
      | input[type=checkbox]       |
      | input[type=color]          |
      | input[type=date]           |
      | input[type=datetime]       |
      | input[type=datetime-local] |
      | input[type=email]          |
      | input[type=file]           |
      | input[type=month]          |
      | input[type=number]         |
      | input[type=password]       |
      | input[type=radio]          |
      | input[type=range]          |
      | input[type=search]         |
      | input[type=tel]            |
      | input[type=text]           |
      | input[type=time]           |
      | input[type=url]            |
      | input[type=week]           |

Feature: Correctly use `title` attributes

  Scenario: Check the elements with title attributes

    Examples of failure:

        <label for="name">Name</label>
        <input type="text" id="name" name="name" title="Name" />

        <a href="/news" title="News">News</a>

    When I visit the page
    Then there must be no elements with a title attribute whose content is repeated within the element
    And any form fields with associated labels do not have a title attribute

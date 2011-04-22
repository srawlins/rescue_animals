@success_stories
Feature: Success Stories
  In order to have success_stories on my website
  As an administrator
  I want to manage success_stories

  Background:
    Given I am a logged in refinery user
    And I have no success_stories

  @success_stories-list @list
  Scenario: Success Stories List
   Given I have success_stories titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of success_stories
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @success_stories-valid @valid
  Scenario: Create Valid Success Story
    When I go to the list of success_stories
    And I follow "Add New Success Story"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 success_story

  @success_stories-invalid @invalid
  Scenario: Create Invalid Success Story (without title)
    When I go to the list of success_stories
    And I follow "Add New Success Story"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 success_stories

  @success_stories-edit @edit
  Scenario: Edit Existing Success Story
    Given I have success_stories titled "A title"
    When I go to the list of success_stories
    And I follow "Edit this success_story" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of success_stories
    And I should not see "A title"

  @success_stories-duplicate @duplicate
  Scenario: Create Duplicate Success Story
    Given I only have success_stories titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of success_stories
    And I follow "Add New Success Story"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 success_stories

  @success_stories-delete @delete
  Scenario: Delete Success Story
    Given I only have success_stories titled UniqueTitleOne
    When I go to the list of success_stories
    And I follow "Remove this success story forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 success_stories
 
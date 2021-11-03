Feature: search for food by its name

  As a food buff
  So that I can find food with my favorite restaurant
  I want to include and search on restaurant information in food I enter

Background: food in database

  Given the following food exist:
  | title        | rating | restaurant     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: add restaurant to existing food
  When I go to the edit page for "Alien"
  And  I fill in "restaurant" with "Ridley Scott"
  And  I press "Update food Info"
  Then the restaurant of "Alien" should be "Ridley Scott"

Scenario: find food with same restaurant
  Given I am on the details page for "Star Wars"
  When  I follow "Find food With Same restaurant"
  Then  I should be on the Similar food page for "Star Wars"
  And   I should see "THX-1138"
  But   I should not see "Blade Runner"
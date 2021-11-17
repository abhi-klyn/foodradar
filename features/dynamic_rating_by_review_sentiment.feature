Feature: Dyamically change ratings by the sentiment of the review content

    The app identifies which food item in the menu they are talking about when someone adds a review.
    The app gets sentiment from the review text and then do -1 if it’s a bad review
    or +1 if it's a good review. The menu should display in the order of rating.

Background: restaurants and foods in database

  Given the following restaurants exist:
  | restaurant_name | address                            | cuisine  |
  | Mels Burger     | 2850 Broadway, New York, NY 10025  | American |
  | Koronet Pizza   | 2848 Broadway, New York, NY 10025  | Italian  |

  Given the following foods exist:
  | food_name        | description                                | price | rating | restaurant_name |
  | Beef Burger      | Beef, Lettuce, Tomato, Cheese              | 10    | 4      | Mels Burger     |
  | Chicken Burger   | Chicken, Lettuce, Tomato, Cheese           | 8     | 4      | Mels Burger     |
  | Cheese Pizza     | Cheese                                     | 8     | 4      | Koronet Pizza   |
  | Pepperoni Pizza  | Pepperoni Cheese                           | 10    | 4      | Koronet Pizza   |


Scenario: I want to submit a positive review and see if it increments the rating depending on its sentiment
  Given I am on the home page
  And I search restaurant "Mels Burger"
  And I press "Menu"
  Then I should see "Beef Burger" before "4.0 out of 5"
  And I should see "4.0 out of 5" before "Chicken Burger"
  And I should see "Chicken Burger" before "4.0 out of 5"
  When I submit a review with username: "John" and text: "Beef Burger very good"
  Then I should see "Beef Burger" before "5.0 out of 5"
  And I should see "5.0 out of 5" before "Chicken Burger"
  And I should see "Chicken Burger" before "4.0 out of 5"

Scenario: I want to submit a negative review and see if it decrements the rating depending on its sentiment and change the order of the menu depending on its rating (descending order)
  Given I am on the home page
  And I search restaurant "Koronet Pizza"
  And I press "Menu"
  Then I should see "Cheese Pizza" before "4.0 out of 5"
  And I should see "4.0 out of 5" before "Pepperoni Pizza"
  And I should see "Pepperoni Pizza" before "4.0 out of 5"
  When I submit a review with username: "John" and text: "Cheese Pizza was horrible"
  Then I should see "Pepperoni Pizza" before "4.0 out of 5"
  And I should see "4.0 out of 5" before "Cheese Pizza"
  And I should see "Cheese Pizza" before "3"

Scenario: I want to see if analyzing sentiment of a review ignores the lower/upper case and correctly change the rating
  Given I am on the home page
  And I search restaurant "Mels Burger"
  And I press "Menu"
  Then I should see "Beef Burger" before "4.0 out of 5"
  And I should see "4.0 out of 5" before "Chicken Burger"
  And I should see "Chicken Burger" before "4.0 out of 5"
  When I submit a review with username: "John" and text: "bEeF bUrGer is vEry gOoD"
  Then I should see "Beef Burger" before "5.0 out of 5"
  And I should see "5.0 out of 5" before "Chicken Burger"
  And I should see "Chicken Burger" before "4.0 out of 5"

  Scenario: I want to see if analyzing sentiment of a review can tolerate typos, find the closest match, and correctly change the rating
  Given I am on the home page
  And I search restaurant "Mels Burger"
  And I press "Menu"
  Then I should see "Beef Burger" before "4.0 out of 5"
  And I should see "4.0 out of 5" before "Chicken Burger"
  And I should see "Chicken Burger" before "4.0 out of 5"
  When I submit a review with username: "John" and text: "Beeef burgr is very good"
  Then I should see "Beef Burger" before "5.0 out of 5"
  And I should see "5.0 out of 5" before "Chicken Burger"
  And I should see "Chicken Burger" before "4.0 out of 5"
  When I submit a review with username: "Jason" and text: "chick burgrr is very good"
  Then I should see "Chicken Burger" before "5.0 out of 5"
  And I should not see "4.0 out of 5"
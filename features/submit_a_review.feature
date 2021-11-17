Feature: submit a review for a restaurant

  Each restaurant page (menu) has a list of reviews.
  I want to be able to submit new reviews and see the added reviews on the page.

Background: restaurants, foods, and reviews in database

  Given the following restaurants exist:
  | restaurant_name | address                            | cuisine  |
  | Mels Burger     | 2850 Broadway, New York, NY 10025  | American |
  | Koronet Pizza   | 2848 Broadway, New York, NY 10025  | Italian  |

  Given the following foods exist:
  | food_name        | description                                | price | rating | restaurant_name |
  | Chicken Burger   | Chicken, Lettuce, Tomato, Cheese           | 8     | 4      | Mels Burger     |
  | Beef Burger      | Beef, Lettuce, Tomato, Cheese              | 10    | 5      | Mels Burger     |
  | Turkey Burger    | Turkey, Lettuce, Tomato, Cheese            | 9     | 2      | Mels Burger     |
  | Pork Burger      | Pork, Lettuce, Tomato, Cheese              | 8     | 3      | Mels Burger     |
  | Cheese Pizza     | Cheese                                     | 8     | 4      | Koronet Pizza   |
  | Pepperoni Pizza  | Pepperoni Cheese                           | 10    | 5      | Koronet Pizza   |
  | Meat Lover Pizza | Pork, Turkey, Beef, Ham, Pepperoni, Cheese | 9     | 2      | Koronet Pizza   |
  | Vegetarian Pizza | Tomato, Avocado, Pineapple, Cheese         | 8     | 3      | Koronet Pizza   |

  Given the following reviews exist:
  | username | review_text                   | restaurant_name |
  | Samuel   | Chicken Burger was amazing!   | Mels Burger     |
  | Abhishek | Pepperoni Pizza was horrible  | Koronet Pizza   |
  | Lucas    | Turkey Burger was okay        | Mels Burger     |
  | Brian    | Vegetarian Pizza is the best  | Koronet Pizza   |


Scenario: I want to enter a restaurant's menu page and submit a review
  Given I am on the home page
  And I search restaurant "Mels Burger"
  And I press "Menu"
  Then I should see "Samuel" before "Lucas"
  And I should see "Chicken Burger was amazing!" before "Turkey Burger was okay"
  When I submit a review with username: "John" and text: "Beef Burger was okay"
  Then I should see "Lucas" before "John"
  And I should see "Turkey Burger was okay" before "Beef Burger was okay"

Scenario: I want to enter another restaurant's menu page and submit a review
  Given I am on the home page
  And I search restaurant "Koronet Pizza"
  And I press "Menu"
  Then I should see "Abhishek" before "Brian"
  And I should see "Pepperoni Pizza was horrible" before "Vegetarian Pizza is the best"
  When I submit a review with username: "Jason" and text: "Cheese Pizza is tasty"
  Then I should see "Brian" before "Jason"
  And I should see "Vegetarian Pizza is the best" before "Cheese Pizza is tasty"

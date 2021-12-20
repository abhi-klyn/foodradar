Feature: sort the Price, Restaurant name cuisine or price
  The homepage consists of a list of restaurants.
  I want to sort the food search results by price or ratings and restaurant results by name or cuisine

Background: restaurants and foods in database

  Given the following restaurants exist:
  | restaurant_name | address                            | cuisine  |
  | Mels Burger     | 2850 Broadway, New York, NY 10025  | American |
  | Koronet Pizza   | 2848 Broadway, New York, NY 10025  | Italian  |
  | Atlas Kitchen   | 258 W 109th St, New York, NY 10025 | Chinese  |

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

Scenario: I see all the restaurants in original order
  Given I am on the home page
  Then I should see "Mels Burger" before "Koronet Pizza"
  And I should see "Koronet Pizza" before "Atlas Kitchen"

Scenario: I sort on restaurant name
  Given I am on the home page
  And I follow "Restaurant name"
  Then I should see "Atlas Kitchen" before "Koronet Pizza"
  Then I should see "Koronet Pizza" before "Mels Burger"

Scenario: I sort on cuisine
  Given I am on the home page
  And I follow "Cuisine"
  Then I should see "Mels Burger" before "Atlas Kitchen"
  Then I should see "Atlas Kitchen" before "Koronet Pizza"

Scenario: I want to search for food and sort it by price
  Given I am on the home page
  And I search food "burger"
  Then I should see "Chicken Burger"
  Then I should see "Beef Burger"
  Then I should see "Pork Burger"
  Then I should see "Turkey Burger"
  And I follow "Price"
  Then I should see "Pork Burger" before "Chicken Burger"
  Then I should see "Chicken Burger" before "Turkey Burger"
  Then I should see "Turkey Burger" before "Beef Burger"


Scenario: I want to search for food and sort it by rating
  Given I am on the home page
  And I search food "burger"
  And I follow "Rating"
  Then I should see "Turkey Burger" before "Beef Burger"
  Then I should see "Beef Burger" before "Pork Burger"
  Then I should see "Pork Burger" before "Chicken Burger"
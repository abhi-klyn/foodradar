Feature: search for restaurant and visit its menu page

  The homepage consists of a list of restaurants.
  I want to search for a restaurant by its name and be able to see its menu

Background: food in database

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

Scenario: I see all the restaurants
  Given I am on the home page
  Then I should see "Mels Burger" before "Koronet Pizza"
  And I should see "Koronet Pizza" before "Atlas Kitchen"

Scenario: I search for a restaurant
  Given I am on the home page
  And I search restaurant "Mels Burger"
  Then I should see "Mels Burger"
  And I should see "2850 Broadway, New York, NY 10025"
  And I should not see "Koronet Pizza"
  And I should not see "Italian"
  And I should not see "Atlas Kitchen"

Scenario: I search for another restaurant
  Given I am on the home page
  And I search restaurant "Koronet Pizza"
  Then I should see "Koronet Pizza"
  And I should see "Italian"
  And I should not see "Mels Burger"
  And I should not see "American"
  And I should not see "Atlas Kitchen"

Scenario: I want to see the menu for a restaurant, and back button working properly
  Given I am on the home page
  And I search restaurant "Mels Burger"
  And I follow "Menu"
  Then I should see "Mels Burger"
  And I should not see "Koronet Pizza"
  Then I should see "Chicken Burger" before "Beef Burger"
  And I should see "Chicken, Lettuce, Tomato, Cheese" before "Beef, Lettuce, Tomato, Cheese"
  Then I follow "Back"
  Then I should see "Mels Burger" before "Koronet Pizza"
  And I should see "Koronet Pizza" before "Atlas Kitchen"

Scenario: I want to see the menu for another restaurant, and back button working properly
  Given I am on the home page
  And I search restaurant "Koronet Pizza"
  And I follow "Menu"
  Then I should see "Koronet Pizza"
  And I should not see "Atlas Kitchen"
  Then I should see "Pepperoni Pizza" before "Meat Lover Pizza"
  And I should see "Pork, Turkey, Beef, Ham, Pepperoni, Cheese" before "Tomato, Avocado, Pineapple, Cheese"
  Then I follow "Back"
  Then I should see "Mels Burger" before "Koronet Pizza"
  And I should see "Koronet Pizza" before "Atlas Kitchen"
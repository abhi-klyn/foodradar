Given /the following foods exist/ do |foods_table|
    foods_table.hashes.each do |food|
      Food.create food
    end
  end
  
  Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
    expect(page.body.index(e1) < page.body.index(e2))
  end
  
  Then /I should see all the foods/ do
    Food.all.each do |food|
      step %{I should see "#{food.food_name}"}
    end
  end
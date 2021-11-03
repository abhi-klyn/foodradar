require 'spec_helper'
require 'rails_helper'

describe Food do
	describe 'search' do
		before :each do
			@big_mac = Food.create({
				:food_name => 'Big Mac', 
				:description => 'Bun, Beef, Big Mac Sauce, Lettuce, Pickles, Cheese, Onions', 
				:price => '5.00', 
				:rating => '4', 
				:restaurant_name => 'McDonalds', 
			})
			@chicken = Food.create({
				:food_name => 'McChicken', 
				:description => 'Bun, Chicken, Mayonnaise, Lettuce', 
				:price => '4.50', 
				:rating => '5', 
				:restaurant_name => 'McDonalds', 
			})
			@whopper = Food.create({
				:food_name => 'Whopper', 
				:description => 'Bun, Beef, Tomato, Lettuce, Pickles, Cheese, Onions', 
				:price => '4.50', 
				:rating => '3', 
				:restaurant_name => 'Burger King', 
			})
		end
		it "Searching by food name" do
			search = Food.search('Big Mac')
			expect(search).to include(@big_mac)
			expect(search).not_to include(@chicken)
		end
		it "Searching for all foods" do
			search = Food.search(nil)
			expect(search).to include(@big_mac)
			expect(search).to include(@chicken)
			expect(search).to include(@whopper)
		end
		it "Searching by food name that does not exist" do
			search = Food.search('B301nfjal1')
			expect(search).to be_empty
			expect(search).not_to include(@big_mac)
			expect(search).not_to include(@chicken)
			expect(search).not_to include(@whopper)
		end
		it "Search food by restaurant name" do
			search = Food.searchByRestaurant('McDonalds')
			expect(search).to include(@big_mac)
			expect(search).to include(@chicken)
			expect(search).not_to include(@whopper)
		end
		it "Search restaurant that doesnt exist" do
			search = Food.searchByRestaurant('Shake Shack')
			expect(search).to be_empty
			expect(search).not_to include(@big_mac)
			expect(search).not_to include(@chicken)
			expect(search).not_to include(@whopper)
		end
	end

end
require 'spec_helper'
require 'rails_helper'

describe Restaurant do
	describe "Search" do
		before :each do
			@mcdonalds = Restaurant.create({
				:restaurant_name => "McDonalds", 
				:address => "2549 Broadway, New York, NY 10025", 
				:cuisine => "Fast Food"
			})
			@burger_king = Restaurant.create({
				:restaurant_name => "Burger King", 
				:address => "327 W 42nd St, New York, NY 10036", 
				:cuisine => "Fast Food"
			})
		end
		it "Search for restaurant name" do
			search = Restaurant.search('McDonalds')
			expect(search).not_to be_empty
			expect(search).to include(@mcdonalds)
			expect(search).not_to include(@burger_king)
		end
		it "Search for all restaurants" do
			search = Restaurant.search(nil)
			expect(search).not_to be_empty
			expect(search).to include(@mcdonalds)
			expect(search).to include(@burger_king)
		end
		it "Search for invalid restaurant" do
			search = Restaurant.search('oFOINlnsd') 
			expect(search).to be_empty
			expect(search).not_to include(@mcdonalds)
		end
	end
end
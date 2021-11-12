require 'rails_helper'

RSpec.describe "reviews/index", type: :view do
  before(:each) do
    assign(:reviews, [
      Review.create!(
        review_text: "MyText",
        restaurant_name: "Restaurant Name"
      ),
      Review.create!(
        review_text: "MyText",
        restaurant_name: "Restaurant Name"
      )
    ])
  end

  it "renders a list of reviews" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Restaurant Name".to_s, count: 2
  end
end

require 'rails_helper'

RSpec.describe "reviews/new", type: :view do
  before(:each) do
    assign(:review, Review.new(
      review_text: "MyText",
      restaurant_name: "MyString"
    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do

      assert_select "textarea[name=?]", "review[review_text]"

      assert_select "input[name=?]", "review[restaurant_name]"
    end
  end
end

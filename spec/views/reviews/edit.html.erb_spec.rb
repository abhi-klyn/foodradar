require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      review_text: "MyText",
      restaurant_name: "MyString"
    ))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do

      assert_select "textarea[name=?]", "review[review_text]"

      assert_select "input[name=?]", "review[restaurant_name]"
    end
  end
end

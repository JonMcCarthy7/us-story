require 'rails_helper'

RSpec.describe "relationships/edit", type: :view do
  before(:each) do
    @relationship = assign(:relationship, Relationship.create!(
      title: "MyString",
      description: "MyText",
      type: ""
    ))
  end

  it "renders the edit relationship form" do
    render

    assert_select "form[action=?][method=?]", relationship_path(@relationship), "post" do

      assert_select "input[name=?]", "relationship[title]"

      assert_select "textarea[name=?]", "relationship[description]"

      assert_select "input[name=?]", "relationship[type]"
    end
  end
end

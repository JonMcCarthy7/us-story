require 'rails_helper'

RSpec.describe "relationships/new", type: :view do
  before(:each) do
    assign(:relationship, Relationship.new(
      title: "MyString",
      description: "MyText",
      type: ""
    ))
  end

  it "renders new relationship form" do
    render

    assert_select "form[action=?][method=?]", relationships_path, "post" do

      assert_select "input[name=?]", "relationship[title]"

      assert_select "textarea[name=?]", "relationship[description]"

      assert_select "input[name=?]", "relationship[type]"
    end
  end
end

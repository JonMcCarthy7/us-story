require 'rails_helper'

RSpec.describe "relationships/index", type: :view do
  before(:each) do
    assign(:relationships, [
      Relationship.create!(
        title: "Title",
        description: "MyText",
        type: "Type"
      ),
      Relationship.create!(
        title: "Title",
        description: "MyText",
        type: "Type"
      )
    ])
  end

  it "renders a list of relationships" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Type".to_s, count: 2
  end
end

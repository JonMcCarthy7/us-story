require 'rails_helper'

RSpec.describe "entries/index", type: :view do
  before(:each) do
    assign(:entries, [
      Entry.create!(
        title: "Title",
        description: "MyText",
        entry_type: "Entry Type",
        type: "Type",
        status: "Status",
        user: nil,
        relationship: nil,
        entry: nil
      ),
      Entry.create!(
        title: "Title",
        description: "MyText",
        entry_type: "Entry Type",
        type: "Type",
        status: "Status",
        user: nil,
        relationship: nil,
        entry: nil
      )
    ])
  end

  it "renders a list of entries" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Entry Type".to_s, count: 2
    assert_select "tr>td", text: "Type".to_s, count: 2
    assert_select "tr>td", text: "Status".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end

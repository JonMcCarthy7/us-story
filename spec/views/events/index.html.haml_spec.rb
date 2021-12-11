require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        title: "Title",
        description: "MyText",
        event_type: "Event Type",
        status: "Status",
        user: nil,
        relationship: nil,
        event_id: nil
      ),
      Event.create!(
        title: "Title",
        description: "MyText",
        event_type: "Event Type",
        status: "Status",
        user: nil,
        relationship: nil,
        event_id: nil
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Event Type".to_s, count: 2
    assert_select "tr>td", text: "Status".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end

require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      title: "MyString",
      description: "MyText",
      event_type: "MyString",
      status: "MyString",
      user: nil,
      relationship: nil,
      event_id: nil
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input[name=?]", "event[title]"

      assert_select "textarea[name=?]", "event[description]"

      assert_select "input[name=?]", "event[event_type]"

      assert_select "input[name=?]", "event[status]"

      assert_select "input[name=?]", "event[user_id]"

      assert_select "input[name=?]", "event[relationship_id]"

      assert_select "input[name=?]", "event[event_id_id]"
    end
  end
end

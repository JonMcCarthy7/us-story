require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      title: "MyString",
      description: "MyText",
      event_type: "MyString",
      status: "MyString",
      user: nil,
      relationship: nil,
      event_id: nil
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

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

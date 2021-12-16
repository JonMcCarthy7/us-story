require 'rails_helper'

RSpec.describe "entries/new", type: :view do
  before(:each) do
    assign(:entry, Entry.new(
      title: "MyString",
      description: "MyText",
      entry_type: "MyString",
      type: "",
      status: "MyString",
      user: nil,
      relationship: nil,
      entry: nil
    ))
  end

  it "renders new entry form" do
    render

    assert_select "form[action=?][method=?]", entries_path, "post" do

      assert_select "input[name=?]", "entry[title]"

      assert_select "textarea[name=?]", "entry[description]"

      assert_select "input[name=?]", "entry[entry_type]"

      assert_select "input[name=?]", "entry[type]"

      assert_select "input[name=?]", "entry[status]"

      assert_select "input[name=?]", "entry[user_id]"

      assert_select "input[name=?]", "entry[relationship_id]"

      assert_select "input[name=?]", "entry[entry_id]"
    end
  end
end

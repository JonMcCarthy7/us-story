require 'rails_helper'

RSpec.describe "entries/edit", type: :view do
  before(:each) do
    @entry = assign(:entry, Entry.create!(
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

  it "renders the edit entry form" do
    render

    assert_select "form[action=?][method=?]", entry_path(@entry), "post" do

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

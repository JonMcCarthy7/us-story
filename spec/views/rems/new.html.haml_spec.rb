require 'rails_helper'

RSpec.describe "rems/new", type: :view do
  before(:each) do
    assign(:rem, Rem.new(
      content: "MyString",
      user: nil,
      entry: nil
    ))
  end

  it "renders new rem form" do
    render

    assert_select "form[action=?][method=?]", rems_path, "post" do

      assert_select "input[name=?]", "rem[content]"

      assert_select "input[name=?]", "rem[user_id]"

      assert_select "input[name=?]", "rem[entry_id]"
    end
  end
end

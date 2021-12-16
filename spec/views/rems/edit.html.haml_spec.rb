require 'rails_helper'

RSpec.describe "rems/edit", type: :view do
  before(:each) do
    @rem = assign(:rem, Rem.create!(
      content: "MyString",
      user: nil,
      entry: nil
    ))
  end

  it "renders the edit rem form" do
    render

    assert_select "form[action=?][method=?]", rem_path(@rem), "post" do

      assert_select "input[name=?]", "rem[content]"

      assert_select "input[name=?]", "rem[user_id]"

      assert_select "input[name=?]", "rem[entry_id]"
    end
  end
end

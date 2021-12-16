require 'rails_helper'

RSpec.describe "rems/index", type: :view do
  before(:each) do
    assign(:rems, [
      Rem.create!(
        content: "Content",
        user: nil,
        entry: nil
      ),
      Rem.create!(
        content: "Content",
        user: nil,
        entry: nil
      )
    ])
  end

  it "renders a list of rems" do
    render
    assert_select "tr>td", text: "Content".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end

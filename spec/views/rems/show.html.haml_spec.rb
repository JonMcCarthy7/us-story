require 'rails_helper'

RSpec.describe "rems/show", type: :view do
  before(:each) do
    @rem = assign(:rem, Rem.create!(
      content: "Content",
      user: nil,
      entry: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Content/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

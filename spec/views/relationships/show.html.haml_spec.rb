require 'rails_helper'

RSpec.describe "relationships/show", type: :view do
  before(:each) do
    @relationship = assign(:relationship, Relationship.create!(
      title: "Title",
      description: "MyText",
      type: "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Type/)
  end
end

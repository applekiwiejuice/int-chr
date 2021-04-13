require 'rails_helper'

RSpec.describe "numbers/show", type: :view do
  before(:each) do
    @number = assign(:number, Number.create!(
      entered_number: 2,
      converted_number: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end

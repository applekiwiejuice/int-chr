require 'rails_helper'

RSpec.describe "numbers/index", type: :view do
  before(:each) do
    assign(:numbers, [
      Number.create!(
        entered_number: 2,
        converted_number: 3
      ),
      Number.create!(
        entered_number: 2,
        converted_number: 3
      )
    ])
  end

  it "renders a list of numbers" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end

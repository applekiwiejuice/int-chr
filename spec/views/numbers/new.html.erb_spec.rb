require 'rails_helper'

RSpec.describe "numbers/new", type: :view do
  before(:each) do
    assign(:number, Number.new(
      entered_number: 1,
      converted_number: 1
    ))
  end

  it "renders new number form" do
    render

    assert_select "form[action=?][method=?]", numbers_path, "post" do

      assert_select "input[name=?]", "number[entered_number]"

      assert_select "input[name=?]", "number[converted_number]"
    end
  end
end

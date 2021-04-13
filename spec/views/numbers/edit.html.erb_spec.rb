require 'rails_helper'

RSpec.describe "numbers/edit", type: :view do
  before(:each) do
    @number = assign(:number, Number.create!(
      entered_number: 1,
      converted_number: 1
    ))
  end

  it "renders the edit number form" do
    render

    assert_select "form[action=?][method=?]", number_path(@number), "post" do

      assert_select "input[name=?]", "number[entered_number]"

      assert_select "input[name=?]", "number[converted_number]"
    end
  end
end

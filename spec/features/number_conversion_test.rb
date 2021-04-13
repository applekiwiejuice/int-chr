require 'rails_helper'

RSpec.describe 'Number conversion test', type: :feature do
  it 'entered_number = 1 must show converted_number = A' do
    visit root_path
    click_link "New Number"

    within "form" do
      fill_in "number_entered_number", with: "1"
      click_button 'Convert to ASCII'
    end

    expect(page).to have_content 'Number was successfully created.'
    expect(page).to have_content "A"
  end

  it 'entered_number = 20 must show converted_number = T' do
    visit root_path
    click_link "New Number"

    within "form" do
      fill_in "number_entered_number", with: "20"
      click_button 'Convert to ASCII'
    end

    expect(page).to have_content 'Number was successfully created.'
    expect(page).to have_content "T"
  end

  it 'entered_number = 1000 must show converted_number = ALL' do
    visit root_path
    click_link "New Number"

    within "form" do
      fill_in "number_entered_number", with: "1000"
      click_button 'Convert to ASCII'
    end

    expect(page).to have_content 'Number was successfully created.'
    expect(page).to have_content "ALL"
  end

  it 'entered_number = 26 must show converted_number = Z' do
    visit root_path
    click_link "New Number"

    within "form" do
      fill_in "number_entered_number", with: "26"
      click_button 'Convert to ASCII'
    end

    expect(page).to have_content 'Number was successfully created.'
    expect(page).to have_content "Z"
  end

  it 'entered_number = 100 must show converted_number = CV' do
    visit root_path
    click_link "New Number"

    within "form" do
      fill_in "number_entered_number", with: "100"
      click_button 'Convert to ASCII'
    end

    expect(page).to have_content 'Number was successfully created.'
    expect(page).to have_content "CV"
  end

end
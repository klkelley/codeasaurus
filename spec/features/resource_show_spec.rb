require 'rails_helper'

feature 'As a student I can view snippets' do
  scenario 'A student can view snippets' do
    visit '/resources'
    click_link("Validating Rails Models")
    resource = Resource.find_by(title: "Validating Rails Models")

    expect(page).to have_content 'Validating Rails Models'
    expect(page).to have_content 'An example of some simple validation methods in Rails.'
  end
end
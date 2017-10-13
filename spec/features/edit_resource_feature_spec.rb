require 'rails_helper'

feature 'A teacher can edit a code snippet' do
  scenario 'As a teacher, I can edit a code snippet' do
    visit '/resources'
    edit_links = page.all('a', text: "edit")
    p edit_links
    # click_link(edit_links[4])
    edit_links[3].click
    expect(page).to have_selector("input[value='Validating Rails Models']")
  end
end
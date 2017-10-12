require 'rails_helper'


feature 'As a user I can login' do
  before (:all) do
    Rails.application.load_seed
  end

  scenario 'A user successfully logs in' do
    visit '/'
    fill_in "user[email]", with: "squiggles@hey.com"
    fill_in "user[password]", with: "password"
    click_button('Log in')
    expect(current_path).to eql(root_path)
  end
end

feature 'As a user I can logout' do
  scenario 'As user successfully logs out' do
    visit '/'
    fill_in "user[email]", with: "squiggles@hey.com"
    fill_in "user[password]", with: "password"
    click_button('Log in')
    click_link('sign out')
    expect(page).to have_content 'Signed out successfully.'
  end

end
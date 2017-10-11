require 'rails_helper'

feature 'As a student I can sign up' do
  scenario 'A student successfully registers' do
    visit '/'
    click_link('sign up')
    fill_in "user[username]", with: "Sammy"
    fill_in "user[email]", with: "sammy@cubs.com"
    fill_in "user[password]", with: "password"
    click_button 'submit'
    expect(page).to have_content 'Sammy'
  end



end
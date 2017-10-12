require 'rails_helper'

feature 'As a student I can sign up' do
  scenario 'A student successfully registers' do
    visit '/'
    click_link('Sign up')
    fill_in "user[email]", with: "sammy@cubs.com"
    fill_in "user[password]", with: "password"
    fill_in 'user[password_confirmation]', with: "password"
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end



end
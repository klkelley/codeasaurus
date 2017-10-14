require 'rails_helper'

feature 'As a student I can view snippets' do
  before (:all) do
    Rails.application.load_seed
  end

  before (:each) do
    visit '/'
    fill_in "user[email]", with: "sammy@student.com"
    fill_in "user[password]", with: "gocubsgo"
    click_button('Log in')
  end
  scenario 'A student can view snippets' do
    visit '/resources'
    click_link("Validating Rails Models")
    resource = Resource.find_by(title: "Validating Rails Models")

    expect(page).to have_content 'Validating Rails Models'
    expect(page).to have_content 'An example of some simple validation methods in Rails.'
  end
end

feature 'As a student I can view videos' do
  before (:each) do
    visit '/'
    fill_in "user[email]", with: "sammy@student.com"
    fill_in "user[password]", with: "gocubsgo"
    click_button('Log in')
  end

  scenario 'A student can access a video page' do
    visit '/resources'
    click_link("Ruby on Rails Tutorial")
    resource = Resource.find_by(title: "Ruby on Rails Tutorial")
    expect(page).to have_current_path resource_path(resource)
    expect(page).to have_content resource.description
  end

  scenario 'A student can view a video' do
    visit '/resources'
    click_link("Ruby on Rails Tutorial")
    expect(page).to have_css('iframe')
  end

end

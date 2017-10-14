require 'rails_helper'

feature 'As a student I can view resources' do
  before (:all) do
    Rails.application.load_seed
  end

  before (:each) do
    visit '/'
    fill_in "user[email]", with: "sammy@student.com"
    fill_in "user[password]", with: "gocubsgo"
    click_button('Log in')
  end

  scenario 'A student visits the resource page' do
    visit '/resources'

    expect(page).to have_content 'Videos'
    expect(page).to have_content 'Snippets'
    expect(page).to have_content 'Markdown'
  end

  scenario 'A student clicks a link' do
    visit '/resources'
    click_link("How to Build a Blog in Rails 4")
    resource = Resource.find_by(title: "How to Build a Blog in Rails 4")
    expect(page).to have_current_path resource_path(resource)
  end
end


feature 'As a student, I can search resources' do
  before (:all) do
    Rails.application.load_seed
  end

  before (:each) do
    visit '/'
    fill_in "user[email]", with: "sammy@student.com"
    fill_in "user[password]", with: "gocubsgo"
    click_button('Log in')
  end

  scenario "The search button doesn't change the page" do
    visit '/resources'
    fill_in "search[term]", with: "Blog in Rails"
    click_button("Search")
    expect(current_path).to eq resources_path
  end

  scenario 'The search field returns a match for a search term with no type specified' do
    visit '/resources'
    fill_in "search[term]", with: "Change Your Life"
    click_button("Search")
    expect(page).to have_content("How to Learn Rails and Change Your Life")
  end

  scenario "The search type returns resources of that type when no search terms are entered" do
    visit '/resources'
    select 'video', from: "search[resource_type]"
    click_button("Search")
    expect(page).to have_css('.video')
  end

  scenario 'The search returns a match for a search term with of the specified type' do
    visit '/resources'
    fill_in "search[term]", with: "Change Your Life"
    select 'video', from: "search[resource_type]"
    click_button("Search")
    expect(page).to have_content("How to Learn Rails and Change Your Life")
    expect(page).to have_css('.video')
  end

  scenario 'The search form returns an alert when no term or type is specified' do
    visit '/resources'
    first_link_list = page.first("ul")
    click_button("Search")
    expect(page.first("ul").path).to eq first_link_list.path
    expect(page).to have_content("Please enter a keyword or resource type and try again.")
    expect(current_path).to eq resources_path
  end

  scenario 'Returns an alert when match is found' do
    visit '/resources'
    fill_in "search[term]", with: "squiggles dfgsdfgsdr go Cubs!"
    click_button("Search")
    expect(page).to have_content("Sorry, nothing matches that search.")
    expect(current_path).to eq resources_path
  end

end

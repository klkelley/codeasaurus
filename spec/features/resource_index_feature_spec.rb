require 'rails_helper'

feature 'As a student I can view resources' do
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
  scenario 'The search field returns a match' do
    visit '/resources'
    fill_in "term", with: "Change Your Life"
    click_button("Search")
    expect(page).to have_content("How to Learn Rails and Change Your Life")
  end

  scenario "The search button doesn't change the page" do
    visit '/resources'
    fill_in "term", with: "Blog in Rails"
    click_button("Search")
    expect(current_path).to eq resources_path
  end
end

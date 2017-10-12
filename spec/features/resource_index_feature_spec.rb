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

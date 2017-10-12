require 'rails_helper'


feature 'As a user I can login' do
  before (:all) do
    Rails.application.load_seed
  end

  scenario 'A user successfully logs in' do
    visit '/'
    fill_in ""
  end
end
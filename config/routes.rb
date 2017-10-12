Rails.application.routes.draw do
  devise_for :users
  # root 'devise/sessions#new'
  root to: 'sessions#new'
  # devise_scope :user do
  #   root to: 'devise/sessions#new'
  # end
  # resources :users
end

Rails.application.routes.draw do
  devise_for :users, :controllers => { :invitations => 'users/invitations' }
  resources :resources do
    resources :issues, only: [:new, :create]
  end
  resources :issues, only: [:index]
  devise_scope :user do
    authenticated do
      root to: "resources#index"
    end
    get "resources/new/:type", to: "resources#new", as: "new"
    unauthenticated do
      root to: 'devise/sessions#new'
    end
  end
end

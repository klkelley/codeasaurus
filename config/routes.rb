Rails.application.routes.draw do
  devise_for :users, :controllers => { :invitations => 'users/invitations' }
  resources :resources
  devise_scope :user do
    authenticated do
      root to: "resources#index"
    end

    unauthenticated do
      root to: 'devise/sessions#new'
    end
  end
end

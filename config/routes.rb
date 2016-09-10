Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: 'users/registrations', sign_in: 'controllers/users_controller'}

  authenticated :user do
    root "items#index", as: :authenticated_root
  end

  resources :users, only: [:show]

  resources :items

  root 'welcome#index'

end

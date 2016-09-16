Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: 'users/registrations', sign_in: 'controllers/users_controller'}

  authenticated :user do
    root "items#index", as: :authenticated_root
  end

  resources :users, only: [:show] do
    resources :items, only: [:create, :destroy]
  end

  root 'welcome#index'

end

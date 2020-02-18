Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "test#index"
  resources :items, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  resources :images, only: [:new, :create]
end

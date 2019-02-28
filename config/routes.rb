Rails.application.routes.draw do
  resources :comments
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    #get 'logout', to: 'devise/sessions#destroy'
  end

  resources :posts
  resources :users
  resources :comments
end

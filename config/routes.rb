Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    #get 'logout', to: 'devise/sessions#destroy'
  end

  root to: 'static#welcome'

  resources :posts do
    member do
      get '/cheer' => 'posts#cheer'
    end
  end

  resources :users

  resources :posts do
    resources: :comments
end

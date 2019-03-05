Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    #get 'logout', to: 'devise/sessions#destroy'
  end

  root to: 'posts#index'

  get '/welcome' => 'static#welcome'

   # resources :posts
    # member do
    #   get '/cheer' => 'posts#cheer'
    # end


  resources :users do
    resources :posts do
      resources :comments
    end
  end

  resources :posts do
    resources :comments
  end

end

# resources :comments

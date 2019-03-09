Rails.application.routes.draw do

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html




  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'logout', to: 'devise/sessions#destroy'
  end


  root 'static#welcome'

  # root to: 'posts#index'




  resources :users do
    resources :posts do
      resources :comments
    end
  end

  resources :posts do
    resources :comments
  end

  resources :posts do
    resources :cheers

    member do
      get '/cheer' => 'cheers#create', as: 'cheer'
    end
  end

end

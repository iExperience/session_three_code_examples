Rails.application.routes.draw do
  resources :posts

  get '/sign_up'  => 'users#new', as: :sign_up
  get '/sign_in'  => 'sessions#new', as: :sign_in
  get '/sign_out' => 'sessions#destroy', as: :sign_out

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  root "posts#index"
end

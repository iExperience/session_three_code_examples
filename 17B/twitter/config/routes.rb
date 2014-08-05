Rails.application.routes.draw do

  devise_for :users

  resources :friendships, only: [:create, :destroy]

  resources :payments, only: [:new, :create]

  resources :cards, only: [:index, :create]

  resources :maps, only: :index

  post "/cards/default" => "cards#default", as: :cards_default

  get "/charts" => "tweets#chart"

  get  "/:handle" => "tweets#index", as: :tweets
  post "/:handle" => "tweets#create"

  delete "tweets/:id" => "tweets#destroy", as: :destroy_tweet

  root "tweets#index"
end

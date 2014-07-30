Rails.application.routes.draw do

  devise_for :users

  resources :friendships, only: [:create, :destroy]

  get  "/:handle" => "tweets#index", as: :tweets
  post "/:handle" => "tweets#create"

  delete "tweets/:id" => "tweets#destroy", as: :destroy_tweet

  root "tweets#index"
end

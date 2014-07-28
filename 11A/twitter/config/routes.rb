Rails.application.routes.draw do

  resources :users

  get "/:handle" => "tweets#index", as: :tweets
  post "/:handle" => "tweets#create"
end

Rails.application.routes.draw do

  devise_for :users

  get  "/:handle" => "tweets#index", as: :tweets
  post "/:handle" => "tweets#create"

  root "tweets#index"
end

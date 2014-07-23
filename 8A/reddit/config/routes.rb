Rails.application.routes.draw do
  resources :reddits, :only => :index

  root "reddits#index"
end

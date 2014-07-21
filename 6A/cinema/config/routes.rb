Rails.application.routes.draw do
  resources :movies

  root 'welcomes#hello'
end

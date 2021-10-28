Rails.application.routes.draw do
  resources :movies, only: [:index]
  namespace :admin do
    resources :movies
  end
end

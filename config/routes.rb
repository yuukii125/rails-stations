Rails.application.routes.draw do
  resources :movies, only: [:index, :show] do
    resources :schedules, only: [:show] do
      resources :sheets, only: [:index]
      resources :reservations, only: [:new, :create]
    end
  end
  resources :sheets, only: [:index]
  namespace :admin do
    resources :schedules, only: [:index, :show, :create, :edit, :update, :destroy]
    resources :movies do
      resources :schedules, only: [:new]
    end
  end
end

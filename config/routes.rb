Rails.application.routes.draw do
  resources :reservations, only: [:create]
  resources :movies, only: [:index, :show] do
    resources :schedules, only: [:show] do
      resources :sheets, only: [:index]
      resources :reservations, only: [:new]
    end
  end
  resources :sheets, only: [:index]
  namespace :admin do
    resources :schedules, only: [:index, :show, :create, :edit, :update, :destroy]
    resources :reservations, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :movies do
      resources :schedules, only: [:new]
    end
  end
end

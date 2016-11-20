Rails.application.routes.draw do
  resources :values, only: [:index, :show] do
    resources :stories, only: [:index, :create]
  end

  resources :stories, only: [:show] 
  resources :reactions, only: [:get, :post]
end

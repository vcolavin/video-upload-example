Rails.application.routes.draw do
  resources :videos, only: [:index, :new, :create, :delete]

  root to:"videos#index"
end

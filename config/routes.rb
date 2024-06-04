Rails.application.routes.draw do
  resources :buildings do
    resources :apartments, only: [:new, :create, :show, :destroy, :index]
  end

  resources :apartments

  root "buildings#index"
end
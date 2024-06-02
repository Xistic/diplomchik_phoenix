Rails.application.routes.draw do
  resources :buildings do
    resources :apartments, only: [:new, :create, :show]
  end

  resources :apartments, only: [:index] do
    resource :apartment_check, only: [:new, :create]
  end

  root "buildings#index"
end
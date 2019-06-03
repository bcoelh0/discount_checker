Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "alerts#new"
  resources :alerts, only: [:create, :destroy, :index]
  #resources :products, only: [:index]

  # root to: "home#index"
  # post "/create", to: "home#create"

  # resources :users, param: :email, only: [] do
  #   resources :products
  # end
end

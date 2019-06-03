Rails.application.routes.draw do
  root to: "alerts#new"
  resources :alerts, only: [:create, :destroy, :index]
end

Rails.application.routes.draw do
  resources :accounts
  resources :users
  resources :transactions
end

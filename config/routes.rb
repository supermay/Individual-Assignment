Rails.application.routes.draw do
  root "batches#show"
  devise_for :users
  resources :batches
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

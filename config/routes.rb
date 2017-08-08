Rails.application.routes.draw do
  root "batches#index"
  devise_for :users
  resources :batches do
    resources :students
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

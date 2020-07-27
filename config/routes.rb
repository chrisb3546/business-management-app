Rails.application.routes.draw do
  resources :clients
  resources :jobs
  resources :services
  resources :service_teches
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root "sessions#home"
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  
  
  
  
  resources :users do
    resources :service_technicians
    resources :services
    resources :clients
    resources :jobs
 end
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

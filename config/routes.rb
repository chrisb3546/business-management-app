Rails.application.routes.draw do
  
  root "sessions#home"
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  
  get '/auth/google_oauth2/callback' => 'sessions#google'

  resources :service_technicians do 
    resources :jobs, only: [:index, :new, :create]
  end
  resources :services
  resources :clients
  resources :users, except: :index
  resources :jobs
  

    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

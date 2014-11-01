LynxShare::Application.routes.draw do
  resources :users
  resources :links
  resources :tags  
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  root 'sessions#new'
end

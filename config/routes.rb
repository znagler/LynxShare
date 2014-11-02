LynxShare::Application.routes.draw do
  resources :users
  resources :links
  resources :tags

  post '/link_search' => 'links#search'
  post '/tag_search' => 'tags#search'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  root 'sessions#new'
end

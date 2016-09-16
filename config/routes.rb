Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  resources :cohorts do
  	resources :rounds
    resources :teams
  	resources :projects
  end

  put '/votes/:id' => 'votes#update'

  delete '/sessions' => 'sessions#destroy'
  post '/sessions' => 'sessions#create'
  get '/sessions' => 'sessions#new'

  get '/' => 'users#index'
end

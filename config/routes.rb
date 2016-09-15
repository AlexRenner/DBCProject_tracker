Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  resources :cohorts

  delete '/sessions' => 'sessions#destroy'
  get '/' => 'users#index'
end

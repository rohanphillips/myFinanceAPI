Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # post '/api-keys', to: 'api_keys#create'
  # delete '/api-keys', to: 'api_keys#destroy'
  # get '/api-keys', to: 'api_keys#index'
  devise_for :users, controllers: {sessions: 'users/sessions'}

  resource :api_keys, only: [:index, :show, :create, :destroy]
end

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: %i(create new show)
  resource :session, only: %i(create new destroy) 
  resources :bands do
    resources :albums, only: %i(new)
  end
  resources :albums, except: %i(new index)
end

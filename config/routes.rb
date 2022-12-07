Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "groups#index"

  resources :users, only: %i[index show]
  resources :groups, only: %i[index show new create destroy] do
    resources :entities, only: %i[index show new create destroy]
  end
end

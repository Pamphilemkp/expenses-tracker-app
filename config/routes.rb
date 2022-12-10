Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :user do
  authenticated do
    root to: 'groups#index'
  end

  unauthenticated do
    root to: 'welcomepages#index', as: 'unauthenticated_user_root'
  end
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: %i[index show]
  resources :groups, only: %i[index show new create] do
    resources :entities, only: %i[new create ]
  end
end

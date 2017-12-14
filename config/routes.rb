Rails.application.routes.draw do
  root to: 'base#index'
  resources :lists do
    resources :list_items
  end
  resources :categories
  post 'authenticate', to: 'authentication#authenticate'
  post 'register', to: 'authentication#register'
end

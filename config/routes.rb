Rails.application.routes.draw do
  resources :list_items
  resources :lists
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
end

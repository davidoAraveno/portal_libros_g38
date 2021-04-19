Rails.application.routes.draw do
  post 'users/create', to: 'users#create', as: 'uc'
  post 'users/log_in', to: 'users#log_in', as: 'login'
  get 'users/index', to: 'users#index', as: 'ui'
  delete 'users/destroy', to: 'users#destroy', as: 'ud'

  patch 'books/update', to: 'books#update', as: 'bu'
  post 'books/create', to: 'books#create', as: 'bc'
  root 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

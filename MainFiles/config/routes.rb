Rails.application.routes.draw do
  resources :employees
  root to: 'static#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :students do
    resources :certificates, only: [:new, :create, :edit, :update, :show, :destroy]
    resources :grades, only: [:new, :create, :edit, :update, :show, :destroy]
  end

  resources :subjects do
    resources :grades, only: [:new, :create, :edit, :update, :show, :destroy]
  end

  resources :class_rooms
  resources :class_types
  resources :teachers
  resources :trainers
  resources :employers
  resources :messages
  resources :emails
  resources :class_lists
  resources :animals
  resources :grades
  get '/api' => redirect('/swagger/dist/index.html?url=/api-docs.json')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

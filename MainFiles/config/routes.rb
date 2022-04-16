Rails.application.routes.draw do
  root to: 'static#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :class_rooms
  resources :class_types
  resources :teachers
  resources :trainers
  resources :employers
  resources :messages
  resources :emails
  resources :subjects
  resources :class_lists
  resources :certificates
  resources :animals
  resources :students
  resources :grades
  get '/api' => redirect('/swagger/dist/index.html?url=/api-docs.json')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

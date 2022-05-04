Rails.application.routes.draw do
  root to: 'static#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/class_types/:id/addsubject', to: 'class_types#addsubject'
  get '/class_types/:id/removesubject', to: 'class_types#removesubject'

  resources :students do
    resources :certificates, only: [:new, :create, :edit, :update, :show, :destroy]
  end



  resources :class_types

  resources :subjects do
    resources :grades, only: [:new, :create, :edit, :update, :show, :destroy]
  end

  resources :class_rooms
  resources :employees
  resources :animals
  resources :class_lists
  resources :teachers
  resources :trainers
  resources :messages
  resources :emails
  get '/api' => redirect('/swagger/dist/index.html?url=/api-docs.json')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

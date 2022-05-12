Rails.application.routes.draw do
  root to: 'static#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/teachers/:id/addsubject/:subject_id', to: 'teachers#addsubject'
  get '/teachers/:id/removesubject/:subject_id', to: 'teachers#removesubject'

  get '/trainers/:id/addsubject/:subject_id', to: 'trainers#addsubject'
  delete '/trainers/:id/removesubject/:subject_id', to: 'trainers#removesubject'

  post '/class_lists/:id/student/:student_id', to: 'class_lists#add_student'
  delete '/class_lists/:id/student/:student_id', to: 'class_lists#remove_student'




  resources :students do
    resources :certificates, only: [:new, :create, :edit, :update, :show, :destroy]
  end




  resources :trainers
  resources :teachers
  resources :employees

  resources :subjects do
    resources :grades, only: [:new, :create, :edit, :update, :show, :destroy]
  end

  resources :emails do
    resources :messages, only: [:new, :create, :edit, :update, :show, :destroy]
  end

  resources :class_types do
      resources :class_rooms, only: [:new, :create, :edit, :update, :show, :destroy]
  end

  resources :animals
  resources :class_lists



  get '/api' => redirect('/swagger/dist/index.html?url=/api-docs.json')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

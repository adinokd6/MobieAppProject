Rails.application.routes.draw do
  root to: 'static#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/teachers/:id/addsubject/:subject_id', to: 'teachers#addsubject'
  post '/teachers/:id/removesubject/:subject_id', to: 'teachers#removesubject'

  get '/class_types/:id/addanimal/:animal_id', to: 'class_types#addanimal'
  post '/class_types/:id/removeanimal/:animal_id', to: 'class_types#removeanimal'

  get '/class_types/:id/addsubject/:subject_id', to: 'class_types#addsubject'
  post '/class_types/:id/removesubject/:subject_id', to: 'class_types#removesubject'

  get '/trainers/:id/addsubject/:subject_id', to: 'trainers#addsubject'
  post '/trainers/:id/removesubject/:subject_id', to: 'trainers#removesubject'

  get '/class_lists/:id/student/:student_id', to: 'class_lists#add_student'
  post '/class_lists/:id/student/:student_id', to: 'class_lists#remove_student'




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

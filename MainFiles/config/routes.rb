Rails.application.routes.draw do
  root to: 'static#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  post '/teachers/:id/addsubject', to: 'teachers#addsubject'
  post '/teachers/:id/removesubject', to: 'teachers#removesubject'

  post '/class_types/:id/addanimal', to: 'class_types#addanimal'
  post '/class_types/:id/removeanimal', to: 'class_types#removeanimal'

  post '/class_types/:id/addsubject', to: 'class_types#addsubject'
  post '/class_types/:id/removesubject', to: 'class_types#removesubject'

  post '/trainers/:id/addsubject', to: 'trainers#addsubject'
  post '/trainers/:id/removesubject', to: 'trainers#removesubject'

  post '/class_lists/:id/addstudent', to: 'class_lists#add_student'
  post '/class_lists/:id/removestudent', to: 'class_lists#remove_student'

  post '/class_types/:id/addtutor', to: 'class_types#addtutor'
  post '/class_types/:id/removetutor', to: 'class_types#removetutor'

  post '/class_types/:id/addlist', to: 'class_types#addlist'



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

Rails.application.routes.draw do
  resources :class_rooms
  resources :class1s
  resources :teachers
  resources :trainers
  resources :employers
  resources :messages
  resources :emails
  resources :subjects
  resources :class_lists
  resources :certificates
  resources :animals
  resources :grades
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

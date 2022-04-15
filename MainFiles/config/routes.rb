Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

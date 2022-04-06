Rails.application.routes.draw do
  resources :certificates
  resources :grades
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  
  resources :schools
  resources :courses do
    resources :homeworks
  end
  resources :questions
  resources :users
  resources :students
  resources :hwsubmissions
  resources :questionsubmissions
  resources :sessions

  get "/logout", to: "sessions#destroy"

  root to: "students#index"

end

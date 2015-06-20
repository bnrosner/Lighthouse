Rails.application.routes.draw do
  
  resources :users
  resources :schools
  resources :courses
  resources :homeworks
  resources :questions
  resources :students do
    resources :hwsubmissions do
      resources :questionsubmissions
    end
  end

  get "/logout", to: "sessions#destroy"

  root to: "students#index"

end

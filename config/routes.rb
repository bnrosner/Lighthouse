Rails.application.routes.draw do
  
  resources :schools do
    resources :courses do
      resources :homeworks do
        resources :questions
      end
    end
  end

  resources :users
  
  resources :students do
    resources :hwsubmissions do
      resources :questionsubmissions
    end
  end

  resources :sessions

  get "/logout", to: "sessions#destroy"

  root to: "students#index"

end

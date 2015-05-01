Rails.application.routes.draw do
  
  get '/people', to: 'people#index'
  get '/people/:id', to: 'people#show'

end

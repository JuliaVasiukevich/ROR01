Rails.application.routes.draw do
  get '/currency', to: 'currency#currency'
  get '/currency/exchange', to: 'currency#exchange'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

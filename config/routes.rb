Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'static_page/home'

  get '/signup', to: 'user#new'
  post '/signup', to: 'user#create'

  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  
  get '/signout', to: 'session#destroy'

  get '/login', to: 'session#new'

  get '/currency_conversion', to: 'currency_conversion#index'
  post '/currency_conversion', to: 'currency_conversion#show', as: 'convert_currency'

  # Defines the root path route ("/")
  root 'static_page#home'
end

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/restaurants', to: 'restaurants#index', defaults: {format: :json}
  get '/restaurants/:id', to: 'restaurants#show'
  delete '/restaurants/:id', to: 'restaurants#destroy'
  get '/restaurants', to: 'restaurants#index', defaults: {format: :json}
  post '/restaurant_pizzas', to: 'restaurant_pizzas#create'

end

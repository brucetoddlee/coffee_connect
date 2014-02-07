CoffeeConnect::Application.routes.draw do
  
  root 'welcome#index'

  get '/places/index' => 'places#index', as: :index

  get '/places/:id' => 'places#show', as: :show

  get "/:yelp_id", to: "places#show", as: "place"

  post "/:yelp_id", to: "tests#create"

  resources :tests

end

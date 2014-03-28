CoffeeConnect::Application.routes.draw do
  
  root to: "places#index"

  post "/places", to: "places#create"

  get "/:yelp_id", to: "places#show", as: "place"

  post "/:yelp_id", to: "tests#create"

  resources :tests

end

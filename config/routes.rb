CoffeeConnect::Application.routes.draw do
  
  root to: "places#index"

  post "/places", to: "places#create"

  get "/places/index" => "places#index", as: :index

  get "/places/:id" => "places#show", as: :show

  get "/:yelp_id", to: "places#show", as: "place"

  post "/:yelp_id", to: "tests#create"

  resources :tests

end

#  Prefix Verb   URI Pattern               Controller#Action
#         root GET    /                         places#index
# places_index POST   /places/index(.:format)   places#create
#        index GET    /places/index(.:format)   places#index
#         show GET    /places/:id(.:format)     places#show
#        place GET    /:yelp_id(.:format)       places#show
#              POST   /:yelp_id(.:format)       tests#create
#        tests GET    /tests(.:format)          tests#index
#              POST   /tests(.:format)          tests#create
#     new_test GET    /tests/new(.:format)      tests#new
#    edit_test GET    /tests/:id/edit(.:format) tests#edit
#         test GET    /tests/:id(.:format)      tests#show
#              PATCH  /tests/:id(.:format)      tests#update
#              PUT    /tests/:id(.:format)      tests#update
#              DELETE /tests/:id(.:format)      tests#destroy

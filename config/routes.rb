CoffeeConnect::Application.routes.draw do
  
  root "welcome#index"

  resources :places

  resources :tests

end

Rails.application.routes.draw do
  resources :characters
  get 'home/index'
  get 'home/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
# definir uma página como inicial
root 'home#index'
  # Defines the root path route ("/")
  # root "articles#index"
end

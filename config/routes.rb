Rails.application.routes.draw do
  devise_for :users
  resources :characters
  resources :users
  get 'home/index'
  get 'home/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
# definir uma página como inicial
root 'characters#index'
  # Defines the root path route ("/")
  # root "articles#index"
end

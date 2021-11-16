Rails.application.routes.draw do
  resources :reviews
  resources :restaurants
  resources :foods
  # get 'home/index'
  root 'home#index'
  post 'restaurants/save'
  # root 'restaurants#add_review'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

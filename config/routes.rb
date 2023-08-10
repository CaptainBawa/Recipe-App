Rails.application.routes.draw do
  devise_for :users

  resources :foods, expect: [:update]
  resources :recipies, expect: [:update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  get '/public_recipies', to: 'recipies#public_recipies'
  get '/shopping_list', to: 'shopping_list#index'

  resources :recipies do
    resources :recipe_foods, only: %i[new create destroy]
  end
  get '/toogle/:id', to: 'recipies#toogle'
  root 'recipies#public_recipies'
end

Rails.application.routes.draw do


# admin
  devise_for :admins

  namespace :admins do
    resources :products_genres
    post 'products_genres' => 'products_genres#index'
    resources :products
    post 'products' => 'products#index'
    resources :admins, only: [:index, :show, :edit, :update]
    resources :ordered_products, only: [:update]
    get 'homes/top'
  end
    post 'admins/products_genres' => 'admins/products_genres#index'
# member
  devise_for :members
  resources :products, only: [:index, :show]
  resources :products_genres, only: [:index, :show]

  resources :cart_products, only: [:index, :create, :update, :destroy, :all_destroy]
  resources :addresses, only: [:index, :edit, :update, :create, :destroy]

  resources :members, only: [:show, :edit, :update, :unsubscribe, :withdraw, :new]
  resources :orders, only: [:show, :confirm, :create, :new, :thanks]
  get 'homes/top'


  # namespace :admins do
  #   resources :cart_products, only: [:index, :create, :update, :destroy, :all_destroy]
  # end

  # namespace :admins do
  #   resources :addresses, only: [:index, :edit, :update, :create, :destroy]
  # end

  # namespace :admins do
  #   resources :members, only: [:show, :edit, :update, :unsubscribe, :withdraw]
  # end

  # namespace :admins do
  #   resources :orders, only: [:show, :confirm, :create, :new, :thanks]
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
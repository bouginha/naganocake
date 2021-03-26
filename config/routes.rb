Rails.application.routes.draw do

# admin
  devise_for :admins, controllers: {
  sessions: 'admins/sessions',
  registrations: 'admins/registrations'}

  namespace :admins do
    resources :products_genres
    post 'products_genres' => 'products_genres#index'
    resources :products
    post 'products' => 'products#index'
    patch :order_status
    patch :order_status
    resources :admins, only: [:index, :show, :edit, :update]
    resources :ordered_products, only: [:update]
    resources :orders, only: [:show, :confirm, :create, :new, :thanks, :index, :update]
  end
    #get 'admins/homes/top'
    post 'admins/products_genres' => 'admins/products_genres#index'

# member
  devise_for :members, controllers: {
  sessions: 'members/sessions',
  registrations: 'members/registrations'}
  resources :products, only: [:index, :show]
  resources :products_genres, only: [:index, :show]

  resources :cart_products, only: [:index, :create, :update, :destroy, :all_destroy]
  resources :addresses, only: [:index, :edit, :update, :create, :destroy]
  get 'members/unsubscribe'
  patch 'members/withdraw'
  resources :members, only: [:show, :edit, :update, :unsubscribe, :withdraw, :new]
  resources :orders, only: [:show, :confirm, :create, :new, :thanks, :index]
  get 'order/confirm' => 'orders#confirm'
  get "order/thanks" => "orders#thanks"
  get 'homes/top'
  get 'homes/about'


  delete :cart_products, to: 'cart_products#all_destroy'

root to: 'homes#top'

end

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
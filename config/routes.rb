Rails.application.routes.draw do
  get "homes/top"
  get 'products_genres/show'
  get 'products_genres/index'
  namespace :admins do
    get 'products_genres/new'
    get 'products_genres/show'
    get 'products_genres/index'
    get 'products_genres/edit'
    get 'products_genres/update'
    get 'products_genres/create'
    get 'products_genres/destroy'
  end
  get 'products/show'
  get 'products/index'
  namespace :admins do
    get 'products/new'
    get 'products/show'
    get 'products/index'
    get 'products/edit'
    get 'products/update'
    get 'products/create'
    get 'products/destroy'
  end
  namespace :admins do
    get 'admins/index'
    get 'admins/show'
    get 'admins/edit'
    get 'admins/update'
  end
  get 'cart_products/index'
  get 'cart_products/create'
  get 'cart_products/update'
  get 'cart_products/destroy'
  get 'cart_products/all_destroy'
  namespace :admins do
    get 'ordered_products/update'
  end
  namespace :admins do
    get 'cart_products/index'
    get 'cart_products/create'
    get 'cart_products/update'
    get 'cart_products/destroy'
    get 'cart_products/all_destroy'
  end
  get 'addresses/index'
  get 'addresses/edit'
  get 'addresses/update'
  get 'addresses/create'
  get 'addresses/destroy'
  namespace :admins do
    get 'addresses/index'
    get 'addresses/edit'
    get 'addresses/update'
    get 'addresses/create'
    get 'addresses/destroy'
  end
  get 'members/show'
  get 'members/edit'
  get 'members/update'
  get 'members/unsubscribe'
  get 'members/withdraw'
  namespace :admins do
    get 'members/show'
    get 'members/edit'
    get 'members/update'
    get 'members/unsubscribe'
    get 'members/withdraw'
  end
  get 'orders/show'
  get 'orders/confirm'
  get 'orders/create'
  get 'orders/new'
  get 'orders/thanks'
  namespace :admins do
    get 'orders/show'
    get 'orders/confirm'
    get 'orders/create'
    get 'orders/new'
    get 'orders/thanks'
  end
  devise_for :admins
  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :admins
  devise_for :members
  get 'ordered_products/update'
  get 'cart_products/index'
  get 'cart_products/create'
  get 'cart_products/update'
  get 'cart_products/destroy'
  get 'cart_products/all_destroy'
  get 'members/show'
  get 'members/edit'
  get 'members/update'
  get 'members/unsubscribe'
  get 'members/withdraw'
  get 'orders/show'
  get 'orders/confirm'
  get 'orders/create'
  get 'orders/new'
  get 'orders/thanks'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

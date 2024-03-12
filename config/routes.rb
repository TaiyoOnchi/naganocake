Rails.application.routes.draw do
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
  end
  root to: "public/homes#top"
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


  #customer
  get 'customers/my_page' => 'public/customers#show', as: 'my_page'
  get 'customers/information/edit' => 'public/customers#edit', as: 'edit_customer'
  patch 'customers/information' => 'public/customers#update', as: 'update_customer'
  get 'customers/withdraw' => 'public/customers#withdraw', as: 'withdraw'
  patch 'customers/withdraw_update' => 'public/customers#withdraw_update', as: 'withdraw_update'


  #item
  get 'items' => 'public/items#index', as: 'items'
  get 'item/:id' => 'public/items#show', as: 'item'

  # cart_item
  get 'cart_items' => 'public/cart_items#index', as: 'cart_items'
  patch 'cart_items/:id' => 'public/cart_items#update', as: 'update_cart_item'
  delete 'cart_items/destroy_all' => 'public/cart_items#destroy_all', as: 'delete_cart_items_all'
  delete 'cart_items/:id' => 'public/cart_items#destroy', as: 'delete_cart_item'
  post 'cart_items' => 'public/cart_items#create', as: 'create_cart_items'
  
  # address
  get 'addresses' => 'public/addresses#index', as: 'addresses'
  get 'addresses/:id/edit' => 'public/addresses#edit', as: 'edit_addresses'
  post 'addresses' => 'public/addresses#create', as: 'create_addresses'
  patch 'addresses/:id' => 'public/addresses#update', as: 'update_addresses'
  delete 'addresses/:id' => 'public/addresses#destroy', as: 'delete_addresses'
  
  # order
  get 'orders/new' => 'public/orders#new', as: 'new_orders'
  post 'orders/check' => 'public/orders#check', as: 'check_orders'
  get 'orders/complete' => 'public/orders#complete', as: 'complete_orders'
  post 'orders' => 'public/orders#create', as: 'create_orders'
  get 'orders' => 'public/orders#index', as: 'orders'
  get 'orders/:id' => 'public/orders#show', as: 'order'
  
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  get 'admin' => 'admin/homes#top', as: 'admin'

  namespace :admin do
    resources :customers, only: [:index,:show, :edit,:update]
    resources :genres, only: [:index,:create, :edit,:update]
    resources :items
    resources :orders, only: [:index,:show,:update]
    resources :order_details, only: [:update]
  end



    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #resources :admin, only: [:index,:show, :edit,:update]
end

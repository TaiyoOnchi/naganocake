Rails.application.routes.draw do

  
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do
    root to: "homes#top"
  
    # customer
    get 'customers/my_page' => 'customers#show', as: 'my_page'
    get 'customers/information/edit' => 'customers#edit', as: 'edit_customer'
    patch 'customers/information' => 'customers#update', as: 'update_customer'
    get 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
    patch 'customers/withdraw_update' => 'customers#withdraw_update', as: 'withdraw_update'
  
    # item
    resources :items, only: [:index, :show]
  
    # cart_item
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all', to: 'cart_items#destroy_all', as: 'delete_all'
      end
    end
  
    # address
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  
    # order
    resources :orders, only: [:index, :new, :create, :show] do
      collection do
        post 'check', to: 'orders#check', as: 'check'
        get 'complete', to: 'orders#complete', as: 'complete'
      end
    end
  end

  




  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  get 'admin' => 'admin/homes#top', as: 'admin'

  namespace :admin do
    resources :customers, only: [:index,:show, :edit,:update]
    resources :genres, only: [:index,:create, :edit,:update]
    resources :items,only: [:new,:index,:create, :edit,:update]
    resources :orders, only: [:index,:show,:update]
    resources :order_details, only: [:update]
  end


    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #resources :admin, only: [:index,:show, :edit,:update]
end

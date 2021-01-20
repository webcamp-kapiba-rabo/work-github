Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  devise_for :admins
  
  namespace :admin do
    resources :customers,only: [:index,:show,:edit,:update] 
    resources :products, only: [:new, :create, :index, :show, :edit, :update]
    root 'products#top'
    resources :order, only: [:new, :create, :index, :show]
    resources :genre, only: [:create, :index, :edit, :update]
    resources :order_products, only: [:update]
  end
  
  devise_for :customers
  root 'homes#top'
  get 'homes/about' => 'homes#about'
  scope module: :public do
    get 'customer/quit' => 'customers#quit'
    patch 'customer/goodbye' => 'customers#goodbye'
    patch 'customer/edit' => 'customers#edit'
    patch 'customer/update' => 'customers#update'
    patch 'customer' => 'customers#show'
    resources :products, only: [:index, :show]
    resources :cart_products, only: [:index, :create, :update, :destroy]
    patch 'cart_products' => 'cart_products#all_destroy'
    get 'orders/verification' => 'orders#verification'
    get 'orders/done' => 'orders#done'
    resources :order, only: [:new, :create, :index, :show]
    resources :order_products, only: [:create, :destroy]
    resources :addresses,only: [:create, :index, :edit, :update, :destroy] 
  end
end

Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  }
  
  namespace :admin do
    resources :customers,only: [:index,:show,:edit,:update]
    resources :products, only: [:new, :create, :index, :show, :edit, :update]
    root 'products#top'
    resources :orders, only: [:update, :index, :show]
    resources :genres, only: [:create, :index, :edit, :update]
    resources :order_products, only: [:update]
  end
  
  devise_for :customers, controllers: {
  sessions: 'publics/sessions',
  registrations: 'publics/registrations'
  }

  scope module: :public do
    root 'homes#top'
    get 'homes/about' => 'homes#about'  
    get 'customer/quit' => 'customers#quit'
    patch 'customer/goodbye' => 'customers#goodbye'
    resource :customer, only: [:show, :edit, :update]
    resources :products, only: [:index, :show]
    delete 'cart_products' => 'cart_products#all_destroy'
    resources :cart_products, only: [:index, :create, :update, :destroy]
    post 'orders/verification' => 'orders#verification'
    get 'orders/done' => 'orders#done'
    resources :orders, only: [:new, :create, :index, :show]
    resources :order_products, only: [:create, :destroy]
    resources :addresses,only: [:create, :index, :edit, :update, :destroy]
  end
end

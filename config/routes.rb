Rails.application.routes.draw do
    
 root to: "public/homes#top"
 
 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

scope module: :public do
    get 'about' => 'homes#about', as: "about"
    
    resources :items, only: [:show, :index]
    
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch "customers/information" => 'customers#update'
    get 'customers/confirm' => 'customers#confirm'
    patch "customers/withdraw" => 'customers#withdraw', as: "withdraw"
    
    resources :cart_items, only: [:index, :destroy, :update, :create]
    delete "cart_items/destroy_all" => 'cart_items#destroy_all', as: "destroy_all"
    
    resources :orders, only: [:new, :index, :show, :create]
    post 'orders/confirm' => 'orders#confirm'
    get "orders/complete" => 'orders#complete', as: "complete"
    
    resources :addresses, only: [:edit, :index, :update, :create, :destroy]
    
 end
    
    get "admin" => "admin/homes#top"
namespace :admin do
    
    resources :items, only: [:index, :new, :create, :show, :edit, :update]

    resources :genres, only: [:index, :create, :edit, :update]
    
    resources :customers, only: [:show, :index, :edit, :update]

    resources :orders, only: [:show, :update]
    
    patch "order_items/:id" => "order_items#update"
    
 end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

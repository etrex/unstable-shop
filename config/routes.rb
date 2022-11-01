Rails.application.routes.draw do

  root to: "products#index"
  resources :products, only: [:index, :show]
  resources :orders, only: [:index, :show]
  resource :cart, only: [:show, :update] do
    post :checkout, to: 'carts#checkout'
  end

  namespace :admin do
    resources :users
    resources :oauth_providers
    resources :products
    resources :orders
    resources :order_items

    root to: "users#index"
  end

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  get :index, to: "home#index"

  # 加入好友時的自我介紹訊息
  get "follow", to: "home#index"
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :items
  resources :order_lists
  get '/orders/:id/payment_confirmation', to: 'orders#payment_confirmation', as: "payment_confirmation"
  resources :orders, only: [:show, :destroy]
  get '/orders/:id/payment_method', to: 'orders#payment_method', as: "payment_method"
  get '/orders/:id/thanks_message', to: 'orders#thanks_message', as: "thanks_message"
  get '/account', to: 'orders#account', as: "account"
  get '/orders/:id/profile', to: 'orders#profile' 
  get '/orders/:id/my_orders_notification', to: 'orders#my_orders_notification', as: "my_orders_notification"
  get '/my_orders/:id', to: 'orders#my_orders', as: "my_orders"
  get '/my_archives', to: 'orders#my_archives', as: "my_archives"
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :items
  resources :order_lists
  get '/orders/:id/payment_confirmation', to: 'orders#payment_confirmation', as: "payment_confirmation"
  resources :orders, only: [:show]
  get '/orders/:id/payment_method', to: 'orders#payment_method', as: "payment_method"
  get '/orders/:id/thanks_message', to: 'orders#thanks_message', as: "thanks_message"
  get '/orders/:id/my_orders', to: 'orders#my_orders', as: "my_orders"
  get '/orders/:id/profile', to: 'orders#profile' 
 
end

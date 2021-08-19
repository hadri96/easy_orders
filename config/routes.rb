Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :items
  resources :order_lists
  resources :orders, only: [:show]
  get '/orders/payment_method', to: 'orders#payment_method'
  get '/orders/payment_confirmation', to: 'orders#payment_confirmation'
  get '/orders/:id/thanks_message', to: 'orders#thanks_message'
end

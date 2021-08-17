Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :items do
    resources :orders, only: [:show]
  end
  get '/orders/payment_method', to: 'orders#payment'
  get '/orders/payment_confirmation', to: 'orders#payment'
  get '/orders/thanks_message', to: 'orders#payment'
end

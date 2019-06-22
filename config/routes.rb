Rails.application.routes.draw do
  devise_for :users
  resources :users, as: :admin_users, path: 'users'
  post 'create_user', to: 'users#create', as: 'create_user'
  get 'send_product_mail/:id', to: 'products#send_product_mail', as: 'send_product_mail'

  get 'products/index'
  resources :products
  root 'products#index'
end

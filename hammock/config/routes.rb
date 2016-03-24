Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  root 'courses#index'
  resources :courses

  resources :courseitems
end
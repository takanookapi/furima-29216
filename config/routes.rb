Rails.application.routes.draw do
  devise_for :users
  root to: 'buy_items#index'
  resources :buyitems
end

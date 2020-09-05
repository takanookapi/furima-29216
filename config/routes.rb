Rails.application.routes.draw do
  devise_for :users
  root to: 'buy_items#index'
  resources :buy_items do
    resources :sell_items, only: [:index, :create]
  end
end

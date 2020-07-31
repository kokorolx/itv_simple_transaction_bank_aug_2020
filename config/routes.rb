Rails.application.routes.draw do
  resources :accounts do
    resources :transactions
  end
  devise_for :users
  root to: 'accounts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

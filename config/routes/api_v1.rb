namespace :api do
  resources :users, only: [] do
    resources :transactions, only: %i[index create]
  end
end
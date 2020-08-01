Rails.application.routes.draw do
  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end

  ######### API
  draw :api_v1
  ######### END API

  resources :accounts do
    resources :transactions
  end
  devise_for :users
  root to: 'accounts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

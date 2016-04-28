Rails.application.routes.draw do
  devise_for :users
  resources :posts 
  
  resources :comments, defaults: { format: 'json' }

  root "posts#index"

  get '/about', to: 'pages#about'
end

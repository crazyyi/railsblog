Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations"}
  resources :posts 
  
  resources :comments, defaults: { format: 'html' }

  root "posts#index"


  get '/about', to: 'pages#about'
end

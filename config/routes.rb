Rails.application.routes.draw do
  root to: 'home_pages#show'
  get '/home', to: redirect('/')

  resources :posts, only: [:index, :show]

  # Admin
  namespace :admin do
    resources :posts
  end
end

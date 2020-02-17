Rails.application.routes.draw do
  root to: 'home_pages#show'
  get '/home', to: redirect('/')

  resources :posts, only: [:show]

  get '/student-process', to: 'process_pages#student', page_path: 'student-process'
  get '/teacher-process', to: 'process_pages#teacher', page_path: 'teacher-process'

  # Admin
  namespace :admin do
    resources :posts
  end
end

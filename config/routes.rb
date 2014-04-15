Taskmanager::Application.routes.draw do
  root to: 'home#index'
  get "home/index"

  devise_for :users

  resources :users

  resources :projects do
    resources :tasks
    resources :projects_users, only: [:new, :create]
  end
end

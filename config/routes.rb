 Taskmanager::Application.routes.draw do
root to: 'home#index'
get "home/index"

devise_for :users

resources :users

resources :projects do
  resources :tasks
  member do
    get 'add_user_to'
  end
end


end

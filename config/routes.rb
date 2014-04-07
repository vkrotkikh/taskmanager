 Taskmanager::Application.routes.draw do
root to: 'home#index'
get "home/index"

devise_for :users

resources :users, :tasks

resources :projects do
  member do
    get 'add_user_to'
  end
end


end

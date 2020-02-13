Rails.application.routes.draw do
  resources :quests
  resources :users

  root to: 'quests#index'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  namespace :admin, path: "sj3xu418" do
    resources :users
  end
end

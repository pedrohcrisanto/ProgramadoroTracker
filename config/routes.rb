Rails.application.routes.draw do
  resources :configuration_task
  resources :categories

  resources :tasks do
    get 'check', on: :member
  end

  devise_for :users, :controllers => { 
    registrations: 'registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root to: 'pages#home'

  get 'config/', to: 'pages#get_config', as: :get_task
  post 'setStatusTask/', to: 'pages#set_status_task', as: :set_status_task

  resources :dashboard, only: [:index] do
    collection do
      get :dashboard, :stats
    end
  end
end

Rails.application.routes.draw do
  root 'major_tasks#index'
  get 'major_tasks/index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
    resources :major_tasks
  end

  resources :major_tasks do
    resources :sub_tasks
  end

end

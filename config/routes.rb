Rails.application.routes.draw do
  get 'major_tasks/index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :major_tasks do
    collection do
    end
  end
end

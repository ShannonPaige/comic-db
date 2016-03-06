Rails.application.routes.draw do

  get 'welcome/index'

  root 'welcome#index'
  resources :connections, only: [:new, :create]
  # resources :characters

end

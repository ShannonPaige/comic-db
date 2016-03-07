Rails.application.routes.draw do

  get 'welcome/index'

  root 'welcome#index'
  resources :connections, only: [:new]
  # resources :characters
  namespace :api do
    namespace :v1 do
      resources :connections, only: [:index], defaults: {format: :json}
    end
  end

end

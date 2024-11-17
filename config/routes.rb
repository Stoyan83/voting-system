Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  devise_scope :user do
    post '/quick_login', to: 'users/sessions#quick_login', as: :quick_login
  end

  root to: 'polls#index'

  match '/modern/*path', to: 'home#index', via: :all

  resources :polls do
    resources :votes, only: [:create]

    get 'chart', on: :member
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
  get 'service-worker' => 'rails/pwa#service_worker', as: :pwa_service_worker
  get 'manifest' => 'rails/pwa#manifest', as: :pwa_manifest
end
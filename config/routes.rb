Rails.application.routes.draw do
  resources :comments
  resources :events do
    resources :child_events
  end
  resources :relationships
  devise_for :users
  root to: 'home#index'
end

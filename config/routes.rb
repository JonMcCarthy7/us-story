Rails.application.routes.draw do

  resources :entries do
    resources :child_entries
  end
  resources :relationships
  devise_for :users
  root to: 'home#index'
end

Rails.application.routes.draw do

  resources :rems
  resources :entries
  resources :parent_entries, path: 'trips' do
    resources :child_entries, path: 'entries'
  end
  resources :relationships
  devise_for :users
  root to: 'home#index'
end

Rails.application.routes.draw do

  resources :rems, except: :show
  resources :entries
  resources :parent_entries, path: 'trips' do
    resources :child_entries, path: 'entries'
  end
  resources :relationships
  resources :files, only: :create
  devise_for :users
  root to: 'home#index'

end

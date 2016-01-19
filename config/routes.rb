Rails.application.routes.draw do

  root 'welcome#index'

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:show]
  resources :timelines, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end

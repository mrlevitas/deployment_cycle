Rails.application.routes.draw do
  Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :events, only: [:show]
      end
    end
  end

  root 'welcome#index'

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:show]
  resources :timelines, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :events, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :memberships, only: [:index, :create, :new]

end

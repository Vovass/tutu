Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :railway_stations do
      patch :update_position, on: :member
    end
    resources :trains do
      resources :carriages, shallow: true # частичная вложенность только для index create new
    end
    resources :routes
    resources :tickets
  end

  resources :tickets, only: [:create, :show]
  resources :searches, path: "search", only: [:new, :show, :edit]
  get '/search(.:format)' => 'searches#show'


  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  get "reroute/okta_authorize" => "reroute#okta_authorize"

  resources :books do
    collection do
      get :search
    end
    resources :comments
  end
  resources :comments

  root "books#index"
end

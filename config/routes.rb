# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  get "reroute/authorize" => "reroute#authorize"

  resources :books do
    collection do
      get :search
    end
    resources :comments
  end
  resources :comments

  root "books#index"
end

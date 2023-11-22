# frozen_string_literal: true

Rails.application.routes.draw do
  resources :books do
    collection do
      get :search
    end
    resources :comments
  end
  resources :comments

  root "books#index"
end

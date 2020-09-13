# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"

  devise_for :users
  resources :articles do
    resources :logs, only: %i(new create update)
  end
  resources :logs, only: %i(show destroy edit)

  get "/tos", to: "welcome#tos"
  get "/policy", to: "welcome#policy"
end

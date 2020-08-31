# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root "articles#index"
  resources :articles
  namespace :charts do
    get "rankings"
  end
end

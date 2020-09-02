# frozen_string_literal: true

Rails.application.routes.draw do
  root "articles#index"

  devise_for :users
  resources :articles
  resources :logs
end

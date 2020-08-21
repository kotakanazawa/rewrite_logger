# frozen_string_literal: true

Rails.application.routes.draw do
  resources :articles
  devise_for :users
  root "users#index"
end

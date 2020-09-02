# frozen_string_literal: true

Rails.application.routes.draw do
  get 'logs/index'
  get 'logs/new'
  get 'logs/show'
  get 'logs/create'
  get 'logs/edit'
  get 'logs/update'
  get 'logs/destroy'
  devise_for :users
  root "articles#index"
  resources :articles
end

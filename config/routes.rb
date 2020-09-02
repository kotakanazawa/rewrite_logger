# frozen_string_literal: true

Rails.application.routes.draw do
  root "articles#index"

  devise_for :users
  resources :articles do
    resources :logs, except: :index, shallow: true
  end
end

# frozen_string_literal: true

Rails.application.routes.draw do
  root 'questions#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users, only: %i[new create]
  resources :questions do
    resources :answers, only: [:create] do
      resources :comments, only: [:create], module: :answers  
    end
    resources :comments, only: [:create], module: :questions
  end
end

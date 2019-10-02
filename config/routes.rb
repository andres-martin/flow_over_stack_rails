# frozen_string_literal: true

Rails.application.routes.draw do
  root 'questions#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :questions do
    resources :comments, only: [:create]
    resources :answers, only: [:create]
    member do
      put "like", to: "questions#upvote"
      put "dislike", to: "questions#downvote"
    end
  end
  resources :answers, only: [:create] do
    # resources :comments, only: [:create], module: :answers
    resources :comments, only: [:create]
    member do
      put "like", to: "answers#upvote"
      put "dislike", to: "answers#downvote"
    end
  end
  # resources :comments, only: [:create]
end

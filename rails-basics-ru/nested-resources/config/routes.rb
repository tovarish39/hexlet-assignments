# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  resources :posts, shallow: true do
    scope module: :posts do
      resources :comments
    end
  end
end

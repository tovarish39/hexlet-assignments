# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root 'home#index'

    resources :movies do
      # BEGIN
      resources :reviews
      scope module: :movies do
        resources :comments
      end
      # END
    end

    resources :reviews, only: %i[index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# test 'should get index' do
#   get movie_comments_url(@movie)

# test 'should get new' do
#   get new_movie_comment_url(@movie)

# test 'should get edit' do
#   get edit_movie_comment_url(@movie, @comment)

# test 'should create' do
#   post movie_comments_url(@movie), params: { comment: @comment_params }

# test 'should update' do
#   patch movie_comment_url(@movie, @comment), params: { comment: @comment_params }

# test 'should destroy' do
#   delete movie_comment_url(@movie, @comment)

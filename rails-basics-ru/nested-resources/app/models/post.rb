# frozen_string_literal: true

class Post < ApplicationRecord # rubocop:disable Style/Documentation
  # BEGIN
  has_many :post_comments
  # END

  validates :title, presence: true
  validates :body, length: { maximum: 500 }
end

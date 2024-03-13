# frozen_string_literal: true

class Task < ApplicationRecord # rubocop:disable Style/Documentation
  validates :name, :status, :creator, presence: true
  validates :completed, inclusion: [true, false]

  attribute :status, :string, default: -> { 'new status' }
end

# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  aasm_state :string
#  body       :text
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
  include AASM

  validates :title, presence: true
  validates :body, length: { maximum: 500 }
  def self.ransackable_associations(auth_object = nil)
    []
  end
  aasm do
    state :draft, initial: true
    state :published

    event :publish do
      transitions from: :draft, to: :published
    end
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[aasm_state title]
  end
end

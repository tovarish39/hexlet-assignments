# frozen_string_literal: true

# == Schema Information
#
# Table name: repositories
#
#  id              :integer          not null, primary key
#  aasm_state      :string
#  default_branch  :string
#  description     :text
#  language        :string
#  link            :string
#  owner_name      :string
#  repo_created_at :datetime
#  repo_name       :string
#  repo_updated_at :datetime
#  watchers_count  :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Repository < ApplicationRecord
  include AASM
  validates :link, presence: true, uniqueness: true

  # BEGIN
  aasm do
    state :created, initial: true
    state :fetching, :fetched, :failed

    event :fetch do
      transitions from: %i[created failed fetched], to: :fetching
    end

    event :fail do
      transitions from: :fetching, to: :failed
    end

    event :success do
      transitions from: :fetching, to: :fetched
    end
  end
  # END
end

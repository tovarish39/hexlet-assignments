# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status_id   :integer
#  user_id     :integer
#
# Indexes
#
#  index_tasks_on_status_id  (status_id)
#  index_tasks_on_user_id    (user_id)
#
class Task < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :status, optional: true

  validates :name, presence: true
  # validates :name, :description, presence: true
end

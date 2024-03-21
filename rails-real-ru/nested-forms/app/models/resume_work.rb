# frozen_string_literal: true

# == Schema Information
#
# Table name: resume_works
#
#  id         :integer          not null, primary key
#  begin_date :date
#  company    :string
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  resume_id  :integer          not null
#
# Indexes
#
#  index_resume_works_on_resume_id  (resume_id)
#
# Foreign Keys
#
#  resume_id  (resume_id => resumes.id)
#
class ResumeWork < ApplicationRecord
  validates :company, presence: true
  validates :begin_date, presence: true

  # BEGIN
  belongs_to :resume, inverse_of: :works
  # END
end

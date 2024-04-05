# frozen_string_literal: true

# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  contact    :string
#  github_url :string
#  name       :string
#  summary    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Resume < ApplicationRecord
  validates :name, presence: true
  validates :contact, presence: true

  # BEGIN
  has_many :works, class_name: 'ResumeWork', inverse_of: :resume, dependent: :destroy
  accepts_nested_attributes_for :works, reject_if: :all_blank, allow_destroy: true

  has_many :educations, class_name: 'ResumeEducation', inverse_of: :resume, dependent: :destroy
  accepts_nested_attributes_for :educations, reject_if: :all_blank, allow_destroy: true

  # END
end

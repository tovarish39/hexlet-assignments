# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  completed   :boolean
#  creator     :string
#  description :text
#  name        :string
#  performer   :string
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
#
# name - обязательное, строка. Название задачи
# description - необязательное. Описание задачи
# status - обязательное, строка. По умолчанию задача создается в новом статусе
# creator - обязательно, строка. Создатель задачи
# performer - необязательное, строка. Тот на кого поставлена задача
# completed - обязательное булево значение
class Task < ApplicationRecord
  validates  :completed, inclusion: [true, false]
  validates :name, :status, :creator, :completed, presence: true
end

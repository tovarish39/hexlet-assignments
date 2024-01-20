# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# name - обязательное, строка. Название задачи
# description - необязательное. Описание задачи
# status - обязательное, строка. По умолчанию задача создается в новом статусе
# creator - обязательно, строка. Создатель задачи
# performer - необязательное, строка. Тот на кого поставлена задача
# completed - обязательное булево значение
# 
#

def creator
  Faker::Name.name
end

2.times do |index| 
  Task.create(
    name: "task #{index}",
    description: "description #{index}",
    status: 'status',
    creator: creator,
    performer: "performer #{index}",
    completed: true
  )
end

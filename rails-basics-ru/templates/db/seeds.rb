# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def name
     Faker::Artist.name
end

def description
    Faker::Movies::HarryPotter.quote
end

def status
     Faker::Movies::HarryPotter.spell
end
def creator
     Faker::Movies::HarryPotter.character
end
def performer
     Faker::Movies::HarryPotter.character
end
def completed
        Faker::Boolean.boolean
end

5.times do
    Task.create(
        name:name,
        description:description,
        status:status,
        creator:creator,
        performer:performer,
        completed:completed
    )
end

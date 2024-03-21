# frozen_string_literal: true

require 'csv'

namespace :hexlet do
  task set_environment: :environment do
  end

  desc 'import users from csv'
  task :import_users, [:file_path] => [:set_environment] do |_task, args|
    arr_of_arrs = CSV.read(args.file_path)
    columns = arr_of_arrs.first.map(&:to_sym)
    datas = arr_of_arrs.slice(1..)
    datas.each do |data|
      user = User.new
      columns.each_with_index do |column, index|
        value = if column == :birthday
                  month, day, year = data[index].split('/').map(&:to_i)
                  Date.new year, month, day
                else
                  data[index]
                end
        user[column] = value
      end
      user.save!
    end
  end
end

# frozen_string_literal: true

# comment
class FixUserId < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :user_id, :author_id
  end
end

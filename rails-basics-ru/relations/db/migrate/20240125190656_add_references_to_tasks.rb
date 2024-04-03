class AddReferencesToTasks < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :user
    add_reference :tasks, :status
  end
end

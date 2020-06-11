class DeleteTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :malor_tasks
  end
end

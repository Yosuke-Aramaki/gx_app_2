class DeleteTable2 < ActiveRecord::Migration[5.2]
  def change
    drop_table :sub_tasks
  end
end

class CreateSubTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_tasks do |t|
      t.string :text
      t.date :start_date
      t.date :end_date
      t.float :time_duration
      t.references :major_task, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

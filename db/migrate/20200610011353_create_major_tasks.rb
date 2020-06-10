class CreateMajorTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :major_tasks do |t|
      t.string :text
      t.date :start_date
      t.date :end_date
      t.float :time_duration
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

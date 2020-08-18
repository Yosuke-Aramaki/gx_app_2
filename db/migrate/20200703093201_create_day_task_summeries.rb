class CreateDayTaskSummeries < ActiveRecord::Migration[5.2]
  def change
    create_table :day_task_summeries do |t|
      t.text :text
      t.date :date
      t.integer :number_of_task
      t.float :time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

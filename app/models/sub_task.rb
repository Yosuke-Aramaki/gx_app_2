class SubTask < ApplicationRecord
  belongs_to :major_task
  has_many :detail_tasks
end

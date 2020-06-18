class SubTask < ApplicationRecord
  belongs_to :major_task
  belongs_to :user
  has_many :detail_tasks
end

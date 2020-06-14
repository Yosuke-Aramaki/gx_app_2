class MajorTask < ApplicationRecord
  belongs_to :user
  has_many :sub_tasks
end

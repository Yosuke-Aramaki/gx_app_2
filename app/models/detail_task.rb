class DetailTask < ApplicationRecord
  belongs_to :sub_task
  belongs_to :user
end

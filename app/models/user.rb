class User < ApplicationRecord
  has_secure_password
  has_many :major_tasks
  has_many :sub_tasks
end

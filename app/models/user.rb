class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true
  has_many :major_tasks
  has_many :sub_tasks
end

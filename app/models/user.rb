class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4 }
  validates :password, presence: true, length: { in: 4..20 }
  validates :email, uniqueness: true
end

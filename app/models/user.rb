class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true, length: {minimum:3, maximum:15}
  validates :email, uniqueness: true, presence: true, length: {minimum:5, maximum:70}
  validates :password, length: { in: 6..30 }
  has_secure_password
end

class User < ApplicationRecord
  validates :username, uniqueness: { case_sensitive: false }, presence: true, length: {minimum:3, maximum:15}
  validates :email, uniqueness: { case_sensitive: false }, presence: true, length: {minimum:5, maximum:70}
  validates :password, length: { in: 6..30 }
  has_secure_password
  has_many :messages, dependent: :destroy
end

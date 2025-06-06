class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :todolists, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end

class User < ApplicationRecord
  has_many :events

  validates :name, presence: true, length: {maximum: 35}
  validates :email, presence: true, length: {maximum: 255}, email: true, uniqueness: true
end

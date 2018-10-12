class User < ApplicationRecord
  has_one_attached :avatar
  has_many :friendships
  has_many :user_spots
  has_many :comments
  has_many :spots, through: :user_spots
  has_many :friends, through: :friendships
  has_many :places, through: :spots


  # has_secure_password
end

class Spot < ApplicationRecord
  has_many :comments
  belongs_to :user
  belongs_to :place
end

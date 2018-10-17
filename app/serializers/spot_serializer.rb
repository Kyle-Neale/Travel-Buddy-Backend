class SpotSerializer < ActiveModel::Serializer
  attributes :id, :spot_type, :user_id, :source
  has_many :comments
  belongs_to :place
end

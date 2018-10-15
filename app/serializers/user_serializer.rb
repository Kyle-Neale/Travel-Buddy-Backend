class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :username, :image_url
  has_many :spots, serializer: SpotSerializer
end

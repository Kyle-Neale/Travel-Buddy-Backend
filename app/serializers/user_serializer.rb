class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :username
  has_many :spots, serializer: SpotSerializer
end

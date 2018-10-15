class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :username, :email
  has_many :spots, serializer: SpotSerializer
end

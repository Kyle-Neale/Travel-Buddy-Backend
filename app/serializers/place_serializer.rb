class PlaceSerializer < ActiveModel::Serializer
  attributes :google_id, :address, :name, :lat, :lng, :phone_number, :website, :description
end

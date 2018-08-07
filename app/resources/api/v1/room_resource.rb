class Api::V1::RoomResource < JSONAPI::Resource
  attributes :name

  has_many :sessions
  filters :name
end

class Api::V1::LevelResource < JSONAPI::Resource
  attributes :name
  filters :name

  has_many :sessions
end

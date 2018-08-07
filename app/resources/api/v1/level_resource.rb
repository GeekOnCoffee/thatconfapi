class Api::V1::LevelResource < JSONAPI::Resource
  attributes :name
  filters :name
end

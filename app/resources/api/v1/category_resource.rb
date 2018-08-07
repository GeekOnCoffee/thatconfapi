class Api::V1::CategoryResource < JSONAPI::Resource
  attributes :name
  filters :name
end

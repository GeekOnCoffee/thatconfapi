class Api::V1::SpeakerResource < JSONAPI::Resource
  attributes :first_name, :last_name
  filters :first_name, :last_name

  has_many :sessions
end

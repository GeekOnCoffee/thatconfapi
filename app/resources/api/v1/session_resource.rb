class Api::V1::SessionResource < JSONAPI::Resource
  attributes :day, :time, :room_id, :speaker_id, :primary_category_id, :secondary_category_id,
    :level_id, :title, :description
end

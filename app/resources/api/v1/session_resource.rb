class Api::V1::SessionResource < JSONAPI::Resource
  attributes :day, :time, :room_id, :speaker_id, :primary_category_id, :secondary_category_id,
    :level_id, :title, :description
  belongs_to :room
  belongs_to :level
  belongs_to :speaker
  belongs_to :primary_category
  belongs_to :secondary_category

  filters :room_id, :level_id, :speaker_id, :primary_category_id, :secondary_category_id
end

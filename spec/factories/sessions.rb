FactoryBot.define do
  factory :session do
    day "MyString"
    time "MyString"
    room nil
    speaker nil
    primary_category nil
    secondary_category nil
    level nil
    title "MyString"
    description "MyText"
  end
end

# rubocop:disable Metrics/LineLength, Lint/UnneededCopDisableDirective
# == Schema Information
#
# Table name: sessions
#
#  created_at            :datetime         not null
#  day                   :string
#  description           :text
#  id                    :bigint(8)        not null, primary key
#  level_id              :bigint(8)
#  primary_category_id   :integer
#  room_id               :bigint(8)
#  secondary_category_id :integer
#  speaker_id            :bigint(8)
#  time                  :string
#  title                 :string
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_sessions_on_level_id    (level_id)
#  index_sessions_on_room_id     (room_id)
#  index_sessions_on_speaker_id  (speaker_id)
#
# rubocop:enable Metrics/LineLength, Lint/UnneededCopDisableDirective

FactoryBot.define do
  factory :speaker do
    first_name "MyString"
    last_name "MyString"
  end
end

# rubocop:disable Metrics/LineLength, Lint/UnneededCopDisableDirective
# == Schema Information
#
# Table name: speakers
#
#  created_at :datetime         not null
#  first_name :string
#  id         :bigint(8)        not null, primary key
#  last_name  :string
#  updated_at :datetime         not null
#
# rubocop:enable Metrics/LineLength, Lint/UnneededCopDisableDirective

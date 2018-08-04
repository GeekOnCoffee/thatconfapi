FactoryBot.define do
  factory :level do
    name "MyString"
  end
end

# rubocop:disable Metrics/LineLength, Lint/UnneededCopDisableDirective
# == Schema Information
#
# Table name: levels
#
#  created_at :datetime         not null
#  id         :bigint(8)        not null, primary key
#  name       :string
#  updated_at :datetime         not null
#
# rubocop:enable Metrics/LineLength, Lint/UnneededCopDisableDirective

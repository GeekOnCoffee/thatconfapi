class Speaker < ApplicationRecord
  has_many :sessions
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

class Category < ApplicationRecord
end

# rubocop:disable Metrics/LineLength, Lint/UnneededCopDisableDirective
# == Schema Information
#
# Table name: categories
#
#  created_at :datetime         not null
#  id         :bigint(8)        not null, primary key
#  name       :string
#  updated_at :datetime         not null
#
# rubocop:enable Metrics/LineLength, Lint/UnneededCopDisableDirective

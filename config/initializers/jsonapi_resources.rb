JSONAPI.configure do |config|
  config.json_key_format = :underscored_key
  config.route_format = :underscored_route

  config.top_level_meta_include_record_count = true
  config.top_level_meta_record_count_key = :record_count

  config.resource_cache = Rails.cache

  config.default_paginator = :paged

  config.default_page_size = 10
  config.maximum_page_size = 100
end

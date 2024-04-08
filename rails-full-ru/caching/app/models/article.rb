# frozen_string_literal: true

class Article < ApplicationRecord
  # BEGIN
  def last_reading_date
    # Rails.cache.fetch("#{cache_key_with_version}/cached_articles", expires_in: 5.seconds)
    updated_at
  end
  # END
end

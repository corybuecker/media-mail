# frozen_string_literal: true

class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    uri = URI.parse(value)

    raise 'not a valid url' unless uri.is_a?(URI::HTTPS)
  rescue StandardError
    record.errors.add attribute, 'is not a valid URL'
  end
end

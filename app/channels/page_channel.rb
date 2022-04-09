# frozen_string_literal: true

class PageChannel < Turbo::StreamsChannel
  def subscribed
    if (stream_name = verified_stream_name_from_params).present? && subscription_allowed?(stream_name)
      stream_from stream_name
    else
      reject
    end
  end

  private

  def subscription_allowed?(stream_name)
    identity, action = stream_name.split(':')

    return false unless User.exists?(identity:)
    return false unless %w[page].include?(action)

    true
  end
end

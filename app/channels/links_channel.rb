# frozen_string_literal: true

class LinksChannel < Turbo::StreamsChannel
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
    user = User.find_by(identity:)

    return false if user.blank?
    return false unless %w[links].include?(action)

    true
  end
end

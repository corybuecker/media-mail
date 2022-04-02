# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :identity

    def connect
      identity = cookies.encrypted['_media_mail_session']['identity']
      return reject_unauthorized_connection if identity.blank?

      self.identity = User.find_by(identity:).identity
    end
  end
end

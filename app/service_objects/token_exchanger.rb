# frozen_string_literal: true

require 'net/http'

class TokenExchanger
  def self.exchange_code(code:)
    new.exchange_code(code)
  end

  def exchange_code(code)
    id_tokens = JWT.decode JSON.parse(fetch_token(code).body)['id_token'], nil, false
    id_tokens.first
  end

  private

  def fetch_token(code)
    Net::HTTP.post_form(URI.parse('https://oauth2.googleapis.com/token'), {
                          code:,
                          client_id: Rails.application.credentials.google.client_id,
                          client_secret: Rails.application.credentials.google.client_secret,
                          redirect_uri: Rails.application.routes.url_helpers.logins_callbacks_url(host: 'http://localhost:3000'),
                          grant_type: 'authorization_code'
                        })
  end
end

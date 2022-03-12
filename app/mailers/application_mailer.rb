# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'newsletter@make-hay.dev'
  layout 'mailer'
end

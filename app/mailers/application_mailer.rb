# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'newsletters@mg.mediamail.dev'
  layout 'mailer'
end

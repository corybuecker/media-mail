# frozen_string_literal: true

class NewsletterMailer < ApplicationMailer
  def page
    @contents = params[:contents]
    @title = params[:title]

    mail to: 'me@corybuecker.com', subject: @title
  end
end

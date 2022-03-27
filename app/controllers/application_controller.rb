# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ActionView::RecordIdentifier

  def render_flash_error(error)
    flash.now[:error] = error
    render turbo_stream: turbo_stream.update('flash', partial: 'shared/flash')
  end
end

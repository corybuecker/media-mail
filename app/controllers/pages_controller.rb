# frozen_string_literal: true

class PagesController < ApplicationController
  def show
    render partial: 'show', locals: { link: user.links.find(params[:id]) }
  end

  private

  def user
    User.find_by!(identity: session[:identity])
  end
end

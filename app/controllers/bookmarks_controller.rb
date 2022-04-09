# frozen_string_literal: true

class BookmarksController < ApplicationController
  def create
    Link.create!(url: params[:url], user:)

    redirect_to root_path
  end

  private

  def user
    User.find_by!(identity: session[:identity])
  end
end

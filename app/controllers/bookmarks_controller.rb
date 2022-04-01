# frozen_string_literal: true

class BookmarksController < ApplicationController
  def create
    Link.create!(url: params[:url])

    redirect_to root_path
  end
end

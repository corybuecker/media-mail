# frozen_string_literal: true

class LinksController < ApplicationController
  def index
    render locals: { links: Link.all.includes(:page) }
  end

  def show
    render locals: { link: Link.find(params[:id]) }
  end

  def create
    link = Link.new(create_params)
    return render locals: { link:, page: link.page } if link.save
    render_flash_error(link.errors.full_messages.join(', ').strip)
  end

  def destroy
    link = Link.find(params[:id])
    return render locals: { link: link } if link.destroy
    render_flash_error(link.errors.full_messages.join(', ').strip)
  end

  private

  def create_params
    params.require(:link).permit(:url)
  end
end

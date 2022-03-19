# frozen_string_literal: true

class LinksController < ApplicationController
  before_action :initialize_link, only: [:create]

  def index
    render locals: { links: Link.all.includes(:page) }
  end

  def create
    if (link = initialize_link) && link.save
      render turbo_stream: turbo_updates_for_create(link)
    else
      flash.now[:error] = link.errors.full_messages.join(', ')
      render turbo_stream: turbo_stream.update('flash', partial: 'shared/flash')
    end
  end

  def destroy
    link = Link.find(params[:id])

    if link.destroy
      render turbo_stream: turbo_stream.remove(link)
    else
      flash.now[:error] = link.errors.full_messages.join(', ')
      render turbo_stream: turbo_stream.update('flash', partial: 'shared/flash')
    end
  end

  private

  def create_params
    params.require(:link).permit(:url)
  end

  def initialize_link
    Link.new(create_params)
  end

  def turbo_updates_for_create(link)
    [
      turbo_stream.append(:links, partial: 'links/link', locals: { link:, page: link.page }),
      turbo_stream.replace(:form, partial: 'links/form')
    ]
  end
end

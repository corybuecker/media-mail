# frozen_string_literal: true

class LinksController < ApplicationController
  def index
    render locals: { links: user.links.order(created_at: :desc).includes(:page), user: }
  end

  def show
    render locals: { link: user.links.find(params[:id]) }
  end

  def create
    link = Link.new(create_params.merge(user:))
    return render locals: { link:, page: link.page } if link.save

    render_flash_error(link.errors.full_messages.join(', ').strip)
  end

  def destroy
    link = user.links.find(params[:id])
    return render locals: { link: } if link.destroy

    render_flash_error(link.errors.full_messages.join(', ').strip)
  end

  private

  def create_params
    params.require(:link).permit(:url)
  end

  def user
    User.find_by!(identity: session[:identity])
  end
end

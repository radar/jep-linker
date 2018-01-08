class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def create
    @link = Link.find_or_create_by(link_params)
    if @link.valid?
      redirect_to @link
    else
      render 'new'
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def forward
    id = params[:short_url].to_i(36)
    @link = Link.find(id)
    redirect_to "http://#{@link.long_url}"
  end

  private

  def link_params
    params.require(:link).permit(:long_url)
  end
end

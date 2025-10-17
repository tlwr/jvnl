class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def destroy
  end
end

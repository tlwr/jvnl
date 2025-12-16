class PicturesController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to picture_path(@picture), notice: "Afbeelding geüpload"
    else
      render :new
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      redirect_to picture_path(@picture), notice: "Afbeelding bijgewerkt"
    else
      render :edit
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_path, notice: "Afbeelding verwijderd"
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :description, :image)
  end
end

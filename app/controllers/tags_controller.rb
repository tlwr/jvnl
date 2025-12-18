class TagsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :destroy ]

  def index
    @tags = Tag.left_joins(:pictures).group("tags.id").select("tags.*, count(pictures.id) as pictures_count").order(:id).to_a
  end

  def show
    @tag = Tag.find(params[:id])
    if user_signed_in?
      @pictures = @tag.pictures
    else
      @pictures = @tag.pictures.where(visible: true)
    end
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tags_path
    else
      render :new
    end
  end

  def destroy
    Tag.find(params[:id]).destroy
    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:id)
  end
end

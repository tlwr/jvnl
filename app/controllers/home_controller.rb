class HomeController < ApplicationController
  def index
    p = Picture.order(id: :desc)
    if user_signed_in?
      @pictures = p.limit(3)
    else
      @pictures = p.where(visible: true).limit(3)
    end
  end

  def random
    picture = Picture.where(visible: true).order("RANDOM()").first
    if picture
      redirect_to picture_path(picture)
    else
      redirect_to root_path, notice: "Geen beelden beschikbaar"
    end
  end
end

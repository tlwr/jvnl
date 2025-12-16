class HomeController < ApplicationController
  def index
    if user_signed_in?
      @pictures = Picture.limit(3)
    else
      @pictures = Picture.where(visible: true).limit(3)
    end
  end
end

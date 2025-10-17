class HomeController < ApplicationController
  def index
    @pictures = Picture.limit(3)
  end
end

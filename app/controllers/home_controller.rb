class HomeController < ApplicationController

  def index
    redirect_to categories_path
    #@users = User.all
  end
end

class AdminController < ApplicationController
  before_filter :authenticate_user!

  def index
    redirect_to list_categories_path
  end

end

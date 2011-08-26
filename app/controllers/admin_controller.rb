class AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_access!

  def index
    redirect_to categories_path
  end

end

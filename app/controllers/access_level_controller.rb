class AccessLevelController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_access!

  def create
  end

  def destroy
  end

end

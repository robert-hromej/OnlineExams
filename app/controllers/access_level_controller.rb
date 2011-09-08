class AccessLevelController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_access!

  def create
    category = Category.find(params[:category_id])
    user = User.find_by_email(params[:email])
    access_level = category.access_levels.where(:user_id => user.id).first || category.access_levels.new(:user_id => user.id)
    access_level.role = AccessLevel::MODERATOR
    access_level.save
    redirect_to edit_category_path(params[:category_id])
  end

  def destroy
    category = Category.find(params[:id])
    access_level = category.access_levels.where(:user_id => params[:user_id]).first
    access_level.destroy if access_level
    redirect_to edit_category_path(params[:id])
  end

end

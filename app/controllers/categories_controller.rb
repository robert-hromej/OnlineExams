class CategoriesController < ApplicationController
  before_filter :authenticate_user!

  before_filter :admin_access!, :only => [:new, :create]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category].merge(:owner_id => current_user.id))
    if @category.save
      flash[:notice] = t('notice.success_create_category', :name => @category.name)
      redirect_to list_categories_path
    else
      # TODO print error messages to web page
      p @category.errors
      render :new
    end
  end


end

class CategoriesController < ApplicationController
  before_filter :authenticate_user!

  before_filter :admin_access!, :only => [:new, :create]

  def list
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
      flash[:notice] = "Success create Exam Category '#{@category.name}'"
      redirect_to list_categories_path
    else
      # TODO print error messages to web page
      p @category.errors
      render :new
    end
  end


end

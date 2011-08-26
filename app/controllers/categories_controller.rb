class CategoriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_access!, :only => [:new, :create]

  add_breadcrumb "Categories", "/categories"

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    add_breadcrumb "New", new_category_path
  end

  def show
    @category = Category.find(params[:id])
    add_breadcrumb @category.name, category_path(@category.id)
  end

  def create
    @category = Category.new(params[:category].merge(:owner_id => current_user.id))
    if @category.save
      flash[:notice] = t('notice.success_create_category', :name => @category.name)
      redirect_to category_path(@category)
    else
      # TODO print error messages to web page
      p @category.errors
      add_breadcrumb "New", new_category_path
      render :new
    end
  end

  def edit
    #  TODO implementation
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    flash[:notice] = t('notice.success_update_category', :name => @category.name)
    render :show
  end

  def destroy
    category = Category.find(params[:id]).destroy
    flash[:notice] = t('notice.success_destroy_category', :name => category.name)
    redirect_to categories_path
  end

end

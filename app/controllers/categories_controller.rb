class CategoriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_access!, :only => [:new, :create, :edit, :update, :destroy]

  before_filter :set_breadcrumb

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
      @errors = @category.errors
      add_breadcrumb "New", new_category_path
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.name = params[:category][:name]
    if @category.save
      flash[:notice] = t('notice.success_update_category', :name => @category.name)
    else
      @errors = @category.errors
    end
    render :show
  end

  def destroy
    begin
      category = Category.find(params[:id]).destroy
      flash[:notice] = t('notice.success_destroy_category', :name => category.name)
    rescue
      flash[:alert] = t('alert.dont_destroy_category', :id => params[:id])
    end
    redirect_to categories_path
  end

  private

  def set_breadcrumb
    add_breadcrumb "Categories", categories_path
  end

end

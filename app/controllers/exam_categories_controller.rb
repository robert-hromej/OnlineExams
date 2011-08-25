class ExamCategoriesController < ApplicationController
  before_filter :authenticate_user!

  before_filter :admin_access!, :only => [:new, :create]

  def list
    @categories = ExamCategory.all
  end

  def new
    @category = ExamCategory.new
  end

  def show
    @category = ExamCategory.find(params[:id])
  end

  def create
    @category = ExamCategory.new(params[:exam_category].merge(:owner_id => current_user.id))
    if @category.save
      flash[:notice] = "Success create Exam Category '#{@category.name}'"
      redirect_to list_exam_categories_path
    else
      # TODO print error messages to web page
      p @category.errors
      render :new
    end
  end


end

class ExamTypesController < ApplicationController
  before_filter :authenticate_user!

  before_filter :admin_access!, :only => [:new, :create]

  def new
    @exam_type = ExamType.new(:exam_category_id => params[:id])
  end

  def create
    @exam_type = ExamType.new(params[:exam_type])
    @exam_type.exam_category_id = params[:exam_category_id]
    @exam_type.owner = current_user
    if @exam_type.save
      flash[:notice] = "Success create Exam Type '#{@exam_type.name}'"
      redirect_to exam_category_path(@exam_type.exam_category_id)
    else
      # TODO print error messages to web page
      p @exam_type.errors
      render :new
    end
  end

end

class TopicController < ApplicationController
  before_filter :authenticate_user!

  before_filter :admin_access!, :only => [:new, :create]

  add_breadcrumb "Categories", "/categories"

  def new
    @topic = Topic.new(:category_id => params[:id])
  end

  def create
    @topic = Topic.new(params[:topic])
    @topic.category_id = params[:category_id]
    @topic.owner = current_user
    if @topic.save
      flash[:notice] = "Success create Exam Type '#{@topic.name}'"
      redirect_to category_path(@topic.category_id)
    else
      # TODO print error messages to web page
      p @topic.errors
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:id])
    add_breadcrumb @topic.category.name, category_path(@topic.category_id)
    add_breadcrumb @topic.name, category_topic_path(@topic.id)
  end


end

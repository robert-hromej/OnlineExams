class ExamController < ApplicationController
  before_filter :authenticate_user!

  def start
    topic = Topic.find(params[:topic_id])
    if topic.current_exam
      flash[:alert] = "please finished the current exam!!)"
      redirect_to continue__exam_path(topic.current_exam)
    end
    @exam = topic.generate_exam(current_user)
  end

  def continue
    @exam = Exam.find(params[:id])
  end

end

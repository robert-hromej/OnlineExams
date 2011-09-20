class QuestionAnswersController < ApplicationController
  before_filter :authenticate_user!

  def create
    @exam_question = ExamQuestion.find(params[:exam_question_id])
    @answers = @exam_question.answering(params[:answer_ids])

    if @answers.blank?
      flash[:alert] = "please select your answer"
    else
      @answers.each do |answer|
        @exam_question.question_answers.create(:answer => answer)
      end
      @exam_question.answered = true
      @exam_question.save
    end
  end

end

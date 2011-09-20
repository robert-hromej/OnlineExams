class CreateQuestionAnswers < ActiveRecord::Migration

  def change
    create_table :question_answers do |t|
      t.belongs_to :answer, :null => false
      t.belongs_to :exam_question, :null => false

      t.timestamps
    end
  end
end

class CreateExamQuestions < ActiveRecord::Migration

  def change
    create_table :exam_questions do |t|
      t.integer :exam_id, :null => false
      t.integer :question_id, :null => false

      t.timestamps
    end
  end

end

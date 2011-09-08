class CreateExamQuestions < ActiveRecord::Migration

  def change
    create_table :exam_questions do |t|
      t.belongs_to :exam, :null => false
      t.belongs_to :question, :null => false
      t.boolean :answered, :null => false, :default => false

      t.timestamps
    end
  end

end

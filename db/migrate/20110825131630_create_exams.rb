class CreateExams < ActiveRecord::Migration

  def change
    create_table :exams do |t|
      t.integer :user_id, :null => false
      t.integer :exam_type_id, :null => false

      t.timestamps
    end
    add_index :exams, :user_id
    add_index :exams, :exam_type_id
  end

end

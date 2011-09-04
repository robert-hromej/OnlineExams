class CreateExams < ActiveRecord::Migration

  def change
    create_table :exams do |t|
      t.integer :user_id, :null => false
      t.integer :topic_id, :null => false

      t.timestamps
    end
    add_index :exams, :user_id
    add_index :exams, :topic_id
  end

end

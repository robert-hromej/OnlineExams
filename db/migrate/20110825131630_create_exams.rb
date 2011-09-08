class CreateExams < ActiveRecord::Migration

  def change
    create_table :exams do |t|
      t.belongs_to :user, :null => false
      t.belongs_to :topic, :null => false
      t.datetime :finished_at

      t.timestamps
    end
    add_index :exams, :user_id
    add_index :exams, :topic_id
  end

end

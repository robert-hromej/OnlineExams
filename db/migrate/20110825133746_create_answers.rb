class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id, :null => false
      t.boolean :is_true, :null => false

      t.timestamps
    end
    add_index :answers, :question_id
  end
end

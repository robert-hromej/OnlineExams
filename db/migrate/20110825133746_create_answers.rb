class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :question, :null => false
      t.boolean :is_true, :null => false
      t.text :body, :null => false

      t.timestamps
    end
    add_index :answers, :question_id
  end
end

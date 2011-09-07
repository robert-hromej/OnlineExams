class CreateQuestions < ActiveRecord::Migration

  def change
    create_table :questions do |t|
      t.integer :owner_id, :null => false
      t.belongs_to :topic, :null => false
      t.text :body
      t.text :answer_description

      t.timestamps
    end
    add_index :questions, :owner_id
    add_index :questions, :topic_id
  end

end

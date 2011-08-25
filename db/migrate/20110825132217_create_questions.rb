class CreateQuestions < ActiveRecord::Migration

  def change
    create_table :questions do |t|
      t.integer :owner_id, :null => false
      t.integer :exam_type_id, :null => false
      t.text :body

      t.timestamps
    end
    add_index :questions, :owner_id
    add_index :questions, :exam_type_id
  end

end

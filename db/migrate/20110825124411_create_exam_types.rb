class CreateExamTypes < ActiveRecord::Migration

  def change
    create_table :exam_types do |t|
      t.integer :exam_level_id, :null => false
      t.integer :exam_category_id, :null => false
      t.integer :owner_id, :null => false
      t.integer :questions_limit, :null => false, :default => 16
      t.integer :time_limit, :null => false, :default => 16*60

      t.timestamps
    end
    add_index :exam_types, :exam_category_id
    add_index :exam_types, :exam_level_id
    add_index :exam_types, :owner_id
  end

end

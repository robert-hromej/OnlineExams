class CreateAccessLevels < ActiveRecord::Migration
  def change
    create_table :access_levels do |t|
      t.integer :user_id, :null => false
      t.integer :exam_category_id, :null => false, :default => 0
      t.integer :exam_type_id, :null => false, :default => 0
      t.integer :role, :null => false, :default => AccessLevel::GHOST

      t.timestamps
    end
    add_index :access_levels, [:user_id, :exam_type_id, :exam_category_id], :unique => true, :name => "uniq_indexing"
  end
end

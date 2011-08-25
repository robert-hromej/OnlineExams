class CreateExamCategories < ActiveRecord::Migration

  def change
    create_table :exam_categories do |t|
      t.string :name
      t.integer :owner_id, :null => false

      t.timestamps
    end
    add_index :exam_categories, :owner_id
  end

end

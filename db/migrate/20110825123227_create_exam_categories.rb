class CreateExamCategories < ActiveRecord::Migration

  def change
    create_table :categories do |t|
      t.string :name
      t.integer :owner_id, :null => false

      t.timestamps
    end
    add_index :categories, :owner_id
  end

end

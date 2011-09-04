class CreateTopics < ActiveRecord::Migration

  def change
    create_table :topics do |t|
      t.string :name, :null => false
      t.integer :category_id, :null => false
      t.integer :owner_id, :null => false
      t.integer :questions_limit, :null => false, :default => 16
      t.integer :time_limit, :null => false, :default => 16*60

      t.timestamps
    end
    add_index :topics, :category_id
    add_index :topics, :owner_id
  end

end

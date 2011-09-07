class CreateAccessLevels < ActiveRecord::Migration
  def change
    create_table :access_levels do |t|
      t.belongs_to :obj, :polymorphic => true, :null => false
      t.references :user, :null => false
      t.integer :role, :null => false, :default => AccessLevel::GHOST

      t.timestamps
    end
    add_index :access_levels, [:user_id, :obj_id, :obj_type], :unique => true, :name => "uniq_indexing"
  end
end

class CreateExemLevels < ActiveRecord::Migration

  def self.up
    create_table :exem_levels do |t|
      t.integer :level

      t.timestamps
    end
  end

  def self.down
    drop_table :exem_levels
  end
end

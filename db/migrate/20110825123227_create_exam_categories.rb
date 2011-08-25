class CreateExamCategories < ActiveRecord::Migration

  def self.up
    create_table :exam_categories do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :exam_categories
  end
end

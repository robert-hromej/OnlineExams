class CreateExamLevels < ActiveRecord::Migration

  def change
    create_table :exam_levels do |t|
      t.integer :level

      t.timestamps
    end
  end

end

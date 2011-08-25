class AddNameToUsers < ActiveRecord::Migration

  def change
    add_column :user, :name, :string
  end

end

class AddAdminToUsers < ActiveRecord::Migration

  def change
    add_column :user, :admin, :boolean, :default => false
  end

end

class RemoveUserIdFromRoles < ActiveRecord::Migration[7.1]
  def change
    remove_column :roles, :user_id
  end
end

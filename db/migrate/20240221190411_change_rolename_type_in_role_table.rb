class ChangeRolenameTypeInRoleTable < ActiveRecord::Migration[7.1]
  def change
    change_column :roles, :rolename, :string
  end
end

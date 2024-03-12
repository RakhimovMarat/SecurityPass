# frozen_string_literal: true

class ChangeColumnTypeInRoleTable < ActiveRecord::Migration[7.1]
  def change
    change_column :roles, :rolename, 'integer USING CAST(rolename AS integer)'
  end
end

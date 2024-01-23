class AddStatusToPass < ActiveRecord::Migration[7.1]
  def change
    add_column :passes, :status, :integer
  end
end

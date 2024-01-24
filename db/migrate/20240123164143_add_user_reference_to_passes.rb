class AddUserReferenceToPasses < ActiveRecord::Migration[7.1]
  def change
    add_reference :passes, :user, index: true
  end
end

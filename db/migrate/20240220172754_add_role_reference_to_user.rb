# frozen_string_literal: true

class AddRoleReferenceToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :role, index: true
  end
end

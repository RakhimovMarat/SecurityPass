# frozen_string_literal: true

class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles do |t|
      t.string :rolename
      t.integer :user_id

      t.timestamps
    end
  end
end

class AddIdentityDocumentToPass < ActiveRecord::Migration[7.1]
  def change
    add_column :passes, :identity_document, :string
  end
end

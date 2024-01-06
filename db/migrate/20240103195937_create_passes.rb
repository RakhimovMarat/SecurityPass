class CreatePasses < ActiveRecord::Migration[7.0]
  def change
    create_table :passes do |t|
      t.string   :visitor_firstname
      t.string   :visitor_lastname
      t.string   :visitor_company
      t.datetime :visit_date
      t.string   :remark

      t.timestamps
    end
  end
end

class CreateUpdateManagers < ActiveRecord::Migration
  def change
    create_table :update_managers do |t|
      t.string :seller_name
      t.string :company
      t.string :model
      t.integer :old_price
      t.integer :new_price
      t.string :url
      t.timestamps
    end
  end
end

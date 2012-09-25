class CreateMobiles < ActiveRecord::Migration
  def change
    create_table :mobiles do |t|
      t.string :category
      t.string :model
      t.string :company
      t.integer :price
      t.string :delivery_time
      t.string :url
      
      t.timestamps
    end
  end
end

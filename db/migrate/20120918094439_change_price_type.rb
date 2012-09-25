class ChangePriceType < ActiveRecord::Migration
  def up
    change_table :mobiles do |t|
    t.remove :price
    t.string :price
    end
  end

  def down
    change_table :mobiles do |t|
    t.remove :price
    t.integer :price
    end
  end
end

class Addcoupon < ActiveRecord::Migration
  def up
    change_table :mobiles do |t|
    t.remove :category
    t.string :coupon
    end
  end

  def down
    change_table :mobiles do |t|
    t.remove :coupon
    t.string :category
    end
  end
end

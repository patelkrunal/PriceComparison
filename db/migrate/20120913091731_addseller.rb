class Addseller < ActiveRecord::Migration
  def up
    change_table :mobiles do |t|
    t.string :seller_name
    end
  end

  def down
    change_table :mobiles do |t|
    t.remove :seller_name
    end
  end
end

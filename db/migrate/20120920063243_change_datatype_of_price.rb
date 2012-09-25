class ChangeDatatypeOfPrice < ActiveRecord::Migration
  def up
    change_table :mobiles do |t|
      t.change :price, :integer
    end
  end

  def down
    change_table :mobiles do |t|
      t.change :price, :string
    end
  end
end

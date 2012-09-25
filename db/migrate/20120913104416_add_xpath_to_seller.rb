class AddXpathToSeller < ActiveRecord::Migration
  def change
    change_table :sellers do |t|
    t.string :xpath_price
    end
  end
end

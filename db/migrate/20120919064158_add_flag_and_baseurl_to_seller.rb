class AddFlagAndBaseurlToSeller < ActiveRecord::Migration
  def change
    change_table :sellers do |t|
    t.integer :flag
    t.string :base_url
    end
  end
end

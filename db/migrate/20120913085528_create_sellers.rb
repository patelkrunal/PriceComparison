class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :seller_name
      t.string :description
      t.string :delivery_time
      t.string :logo_url

      t.timestamps
    end
  end
end

class File1 < ActiveRecord::Migration
    
    def change
    
    add_column :mobiles, :category, :string
    add_column :mobiles, :model, :string
    add_column :mobiles, :company, :string
    add_column :mobiles, :price, :integer
    add_column :mobiles, :delivery_time, :string
    add_column :mobiles, :url, :string
    end
end
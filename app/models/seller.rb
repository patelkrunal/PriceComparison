class Seller < ActiveRecord::Base
  attr_accessible :delivery_time, :description, :logo_url, :seller_name
end

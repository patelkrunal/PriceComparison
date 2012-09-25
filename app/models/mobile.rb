class Mobile < ActiveRecord::Base
  #config.active_record.whitelist_attributes = true
  attr_accessible :model, :company, :price, :delivery_time, :url, :coupon
  
  validates :model, presence: true
  validates :company, presence: true
  validates :price, presence: true
  validates :delivery_time, presence: true
  validates :url, presence: true
  validates :coupon, presence: true
end

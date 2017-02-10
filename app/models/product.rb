class Product < ActiveRecord::Base
  validates :name, :cost, :country, :presence => true
end

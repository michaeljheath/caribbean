class Country < ActiveRecord::Base
  self.table_name = "country"
  has_many :destinations
end
